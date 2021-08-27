import 'dart:async';
import 'dart:convert' as cv;
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/firebase.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:calendrierbiblic/widgets/loading_indicator.dart';
import 'package:calendrierbiblic/widgets/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as FS;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart' as ul;

/// [BibleTranslatesPage]
class BibleTranslatesPage extends StatefulWidget {
  static const id = "BibleTranslatesPage";

  /// methode a appelle apres avoir telecharger une bible et mise a jour la base de donnee
  final void Function(BuildContext) afterDownload;
  final Future<String> Function(BuildContext) afterRending;

  @override
  _StateBibleTranslatesPage createState() => _StateBibleTranslatesPage();

  BibleTranslatesPage({this.afterDownload, this.afterRending});
}

class _StateBibleTranslatesPage extends State<BibleTranslatesPage> {
  final _BibleTranslatesData that;
  bool _updateDatabase = false;

  Future<List<Map<String, dynamic>>> translations;

  _StateBibleTranslatesPage() : this.that = _BibleTranslatesData() {
    that.view = this;
  }

  String search;

  @override
  Widget build(BuildContext context) {
    FbUtils().setCurrentScreen(screenName: BibleTranslatesPage.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).translation),
        actions: <Widget>[
          Search(
            onSubmitted: filter,
            onChanged: filter,
            search: search,
          )
        ],
      ),
      body: Container(
        child: FutureBuilder<List<Map<String, dynamic>>>(
            future: translations ?? that.fetch(),
            builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              final data = snapshot.data;
              data.sort((a, b) => a["translation"].toString().compareTo(b["translation"].toString()));
              Timer(Duration(seconds: 1), () async {
                search = await widget.afterRending?.call(context);
                setState(() {});
              });
              return ListView.builder(itemBuilder: (ctx, index) {
                if (index >= data.length) return null;
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 7, vertical: 9),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 9),
                                  child: Text(
                                    data[index]["translation"] ?? "",
                                    style: Theme.of(context).textTheme.title,
                                    overflow: TextOverflow.fade,
                                  ),
                                )),
                            Expanded(
                              flex: 3,
                              child: Text("Version: ${data[index]["distribution_version"]}",
                                  style: TextStyle(color: Colors.grey.shade700)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              flex: 5,
                              child: Text("${S.of(context).language}: ${data[index]["language"]}",
                                  style: TextStyle(color: Colors.grey.shade700)),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("Date: ${data[index]["distribution_version_date"]}",
                                  style: TextStyle(color: Colors.grey.shade700)),
                            )
                          ],
                        ),
                        data[index]["url"] != null
                            ? FutureBuilder<String>(
                                future: that.fetchHeader(data[index]),
                                builder: (context, AsyncSnapshot<String> snapshot) {
                                  if (!snapshot.hasData) return Container();
                                  data[index]["taille"] = snapshot.data;
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            flex: 5,
                                            child: Text(
                                              snapshot.data != null ? "${S.of(context).size}: ${snapshot.data}" : "",
                                              style: TextStyle(color: Colors.grey.shade700),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: FutureBuilder<int>(future: () async {
                                              return that.findInstalledTranslate(data[index]["abbreviation"]);
                                            }(), builder: (context, snapshot) {
                                              if (!snapshot.hasData) return Container();
                                              return snapshot.data == 0
                                                  ? Text(S.of(context).downloaded)
                                                  : snapshot.data == 1
                                                      ? Text(S.of(context).downloading)
                                                      : snapshot.data == 2
                                                          ? Text(S.of(context).updating)
                                                          : FlatButton(
                                                              padding: EdgeInsets.all(5.0),
                                                              child: Row(
                                                                children: <Widget>[
                                                                  Text("${S.of(context).download} "),
                                                                  Icon(Icons.file_download),
                                                                ],
                                                              ),
                                                              onPressed: () => that.downloadBileAndUpdateDatabase(
                                                                  context, data[index], index),
                                                              clipBehavior: Clip.antiAlias,
                                                            );
                                            }),
                                          ),
                                        ],
                                      ),
                                      if (data[index]["stream"] != null)
                                        LoadingIndicator(
                                          type: LoadingType.Circular,
                                          stream: data[index]["stream"],
                                        )
                                    ],
                                  );
                                })
                            : Container()
                      ],
                    ),
                  ),
                );
              });
            }),
      ),
    );
  }

  void showNetWorkErrorDialog() {
    that.canShowErrorDialogHandler(false);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text(S.of(context).error),
            content: Text.rich(TextSpan(text: S.of(context).error_download_data_msg, children: <InlineSpan>[
              WidgetSpan(
                  child: InkWell(
                      onTap: () async {
                        Scaffold.of(context).hideCurrentSnackBar();
                        final toMailId = "apps.taur@gmail.com";
                        final subject = S.of(context).report_subject;
                        final body = "(${S.of(context).report_body})";
                        var url = 'mailto:$toMailId?subject=$subject&body=$body';
                        if (await ul.canLaunch(url)) {
                          await ul.launch(url);
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(content: Text(S.of(context).report_can_Send)));
                        }
                      },
                      child: Text(
                        S.of(context).send_report,
                        style: TextStyle(decoration: TextDecoration.underline),
                      )))
            ])),
            actions: <Widget>[
              that.catchCount > 10 ? FlatButton(onPressed: () {}, child: Text(S.of(context).send_report)) : Container(),
              FlatButton(
                  onPressed: () {
                    setState(() => that.canShowErrorDialogHandler(true));
                    Navigator.of(context).pop();
                  },
                  child: Text(_PageText.okay)),
            ],
          );
        });
  }

  void filter(String inputValue) async {
    final v = inputValue.trim().length <= 1
        ? that._translations
        : that._translations.where((map) => map.values.join("\n").toLowerCase().contains(inputValue.toLowerCase()));
    setState(() {
      translations = Future.value(v.toList());
    });
  }

  void update() => setState(() {});

  void showDatabaseLoading(Stream<double> stream) {
    if (_updateDatabase) return;
    _updateDatabase = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
              onWillPop: () => Future.value(false),
              child: Dialog(
                child: Container(
                  height: 150,
                  color: Colors.brown.shade50,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        S.of(context).updating_db,
                        style: fn.style.tsBody2.withValues(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
                      ),
                      LoadingIndicator(type: LoadingType.Circular, stream: stream),
                    ],
                  ),
                ),
              ),
            ));
  }

  void dismissLoading() {
    if (!_updateDatabase) return;
    _updateDatabase = false;
    Navigator.of(context).pop();
  }
}

mixin _PageText {
  static const okay = "okay";
}

class _BibleTranslatesData {
  static const _collection = "bible_translations";
  final DbM dbM;
  final currentPendingAbbreviation = <String, int>{};

  /// represent the list of translation
  final _translations = <Map<String, dynamic>>[];

  /// count of the number of error caught
  int catchCount = 0;

  bool errorDialogShow = false;

  /// represent the interface of this controller
  _StateBibleTranslatesPage view;

  _BibleTranslatesData() : dbM = DbM();

  /// return
  ///   -1 not download yet
  ///   0 current downloading
  ///   1 downloaded
  Future<int> findInstalledTranslate(String abbreviation) async {
    if (currentPendingAbbreviation.containsKey(abbreviation ?? '')) return currentPendingAbbreviation[abbreviation];
    try {
      final db = await DbM().database;
      final response = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_id,
          ],
          limit: 1,
          where: "${VersesTable.COLUMNS_translate_id} = ?",
          whereArgs: [abbreviation]);
      if (response.length > 0) return 0;
    } catch (e) {
      print('Error: $e');
    } finally {}
    return -1;
  }

  Future<List<Map<String, dynamic>>> fetch() async {
    if (_translations.length > 0) return _translations;
    try {
      final firestore = FS.Firestore.instance;
//      String str = cv.utf8.decode(res.bodyBytes);
//      final data = cv.json.decode(str) as Map;
//      await firestore.runTransaction((transaction) async {
//        for (final key in data.keys) {
//          data[key].remove("distribution_history") ?? print("null");
//          data[key].remove("distribution_about") ?? print("null");
//          data[key].remove("abbreviation") ?? print("null");
//          await transaction.set(firestore.collection(_collection).document(key), data[key]);
//          translations.add(data[key]);
//        }
//      });
      final snap = await firestore.collection(_collection).getDocuments();
      for (final doc in snap.documents) {
        doc.data["abbreviation"] = doc.documentID;
        _translations.add({"abbreviation": doc.documentID}..addAll(doc.data));
      }
    } catch (e) {
      switch (e.runtimeType) {
        case io.SocketException:
        case CustomError:
          final err = e as io.SocketException;
          fn.log("SocketException => ", err.address, err.port, err.osError.errorCode, err.osError.message, err.message);
          break;
        default:
          fn.log(default_error: e);
      }
    }
    return _translations;
  }

  Future<String> fetchHeader(Map<String, dynamic> data) async {
    if (data["taille"] != null) return data["taille"];
    final url = data["url"];
    String result = "";
    try {
      final client = http.Client();
      final response = await client.head(url);
      int ln = int.parse(response.headers['content-length'].toString());
      if (ln < 1024)
        result = "$ln B";
      else if (ln < 1024 * 1024)
        result = "${ln ~/ 1024} KB";
      else if (ln < 1024 * 1024 * 1024)
        result = "${ln ~/ (1024 * 1024)} MB";
      else if (ln < 1024 * 1024 * 1024 * 1024)
        result = "${ln ~/ (1024 * 1024 * 1024)} GB";
      else
        result = "${ln ~/ (1024 * 1024 * 1024 * 1024)} TB";
      data["taille"] = result;
      data["bitTaille"] = ln;
    } catch (e) {
      switch (e.runtimeType) {
        case io.SocketException:
        case CustomError:
          fn.log(e as io.SocketException, e.runtimeType, error: e);
          if (!errorDialogShow) {
            view?.showNetWorkErrorDialog();
          }
          break;
        default:
          fn.log(default_error: e);
      }
    }
    return result;
  }

  void downloadBileAndUpdateDatabase(BuildContext context, Map<String, dynamic> data, int index) async {
    final url = data["url"];
    final maxSize = data["bitTaille"];
    try {
      final request = http.Request("GET", Uri.parse(url));
      final resStream = await request.send();
      if (resStream.statusCode < 200 || resStream.statusCode >= 300) throw CustomError();
      fn.log(status: resStream.statusCode, body: resStream.stream);
      final stream = resStream.stream;
      StreamController<double> streamController = new StreamController();
      if (maxSize != null && maxSize > 1024) {
        data["stream"] = streamController.stream;
        currentPendingAbbreviation[data["abbreviation"]] = 1;
        view.update();
      }
      final completer = Completer<Uint8List>();
      final sink = cv.ByteConversionSink.withCallback((bytes) => completer.complete(Uint8List.fromList(bytes)));
      int downloadSize = 0;
      Timer timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        streamController.add(downloadSize / maxSize);
      });
      stream.listen((data) {
        downloadSize += data.length;
        return sink.add(data);
      }, onError: (e) {
        fn.log(onError: e);
        completer.completeError(e);
      }, onDone: () {
        sink.close();
        streamController.add(1.1);
        streamController.close();
        data["stream"] = null;
        timer.cancel();
      }, cancelOnError: true);

      final bytes = await completer.future;
      fn.log(getLength: bytes.length, originalSize: data["bitTaille"]);
      currentPendingAbbreviation[data["abbreviation"]] = 2;
      view.update();
      String result = cv.utf8.decode(bytes);
      final map = cv.json.decode(result) as Map;
      final streamCtrl = StreamController<double>();
      view.showDatabaseLoading(streamCtrl.stream);
      double currentAverage = 0;
      timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        streamCtrl.add(currentAverage);
      });
      final v = await dbM.migrateTable(VersesTable.name, map, listner: (average) => currentAverage = average);
      timer.cancel();
      await streamCtrl.close();
      if (v != null) {
        (await fn.pref).setString(fn.KEY.bibleId, v);
      }
      view.dismissLoading();
      currentPendingAbbreviation.remove(["abbreviation"]);
      view.update();
      view.widget.afterDownload?.call(context);
    } catch (e) {
      switch (e.runtimeType) {
        case io.SocketException:
        case CustomError:
          fn.log(error: e);
          if (!errorDialogShow) {
            view?.showNetWorkErrorDialog();
          }
          break;
        default:
          fn.log(default_error: e);
      }
    }
  }

  void canShowErrorDialogHandler(bool show) {
    errorDialogShow = !show;
    if (show) {
      catchCount++;
    }
  }
}

class CustomError extends Error {}
