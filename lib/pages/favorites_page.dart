import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/firebase.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Represente les favoris de l'application
/// todo: afficher la liste des favoris contenant un estrait du verser
/// todo: naviguer vers l'affichage entier d'un verser au click
/// todo: retirer un verser des favoris
class FavoritePage extends StatelessWidget {
  static const id = "FavoriteView";

  @override
  Widget build(BuildContext context) {
    FbUtils().setCurrentScreen(screenName: id);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorites),
      ),
      body: FavoriteView(),
    );
  }
}

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final _FavoriteViewData that;

  static const maxHeight = 500.0;
  final GlobalKey gk = GlobalKey<_FavoriteViewState>();
  Size screen;

  _FavoriteViewState() : this.that = _FavoriteViewData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints.tight(
            screen.height >= 500 ? Size(screen.width, screen.height - 80) : Size(screen.width, 500)),
        child: Column(
          children: <Widget>[Expanded(flex: 2, child: contentFavorite()), Expanded(flex: 1, child: contentHint())],
        ),
      ),
    );
  }

  Widget contentFavorite() {
    return Container(
      child: FutureBuilder<List<Verses>>(
        future: that.fetch(isFavorite: true),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return Container();
          if (!snapshot.hasData || snapshot.hasError || snapshot.data.length == 0)
            return Container(
              child: Center(
                child: Text(
                  S.of(context).favorite_not_found,
                  style: fn.style.tsHeader2,
                ),
              ),
            );
          final len = snapshot.data.length;
          final verses = snapshot.data;
          return PageView.builder(
              controller: PageController(initialPage: that._currentPage),
              itemCount: len,
              onPageChanged: (id) => that._currentPage = id,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      child: Text(
                        "${fn.bookNameOnCurrentLang(context, verses[index].livre)} ${verses[index].chapitre}:${verses[index].num}",
                        style: fn.style.tsHeader,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        verses[index].text,
                        textAlign: TextAlign.center,
                        style: fn.style.tsBody2.withValues(
                            fontSize: fn.gtFontSz(verses[index].text.length, screen.width * (screen.height / 3),
                                min: 17, max: 38)),
                      ),
                    )
                  ],
                );
              });
        },
      ),
    );
  }

  Widget headerHint() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Suggestions"),
        ),
        Expanded(
            child: Container(
          color: Colors.brown.shade900,
          height: 3,
        ))
      ],
    );
  }

  Widget contentHint() {
    return Container(
      constraints: BoxConstraints.expand(height: maxHeight),
      child: FutureBuilder<List<Verses>>(
        future: that.fetch(isFavorite: false),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData || snapshot.hasError)
            return Container();
          final len = snapshot.data.length;
          final verses = snapshot.data;
          final count = 3;
          final totalPages = (len / count).ceil();
          return Column(
            children: <Widget>[
              headerHint(),
              Expanded(
                child: Container(
                  child: PageView.builder(
                      itemCount: totalPages,
                      controller: PageController(initialPage: that._currentHintPage),
                      onPageChanged: (id) => that._currentHintPage = id,
                      itemBuilder: (BuildContext context, int indexPage) {
                        final result = <Widget>[];
                        final start = indexPage * count;
                        for (int index = start; index < start + count && index < len; index++) {
                          result.add(Expanded(
                            child: InkWell(
                              onTap: () {
                                that.addToFavorite(verses[index]);
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      "${fn.bookNameOnCurrentLang(context, verses[index].livre)} ${verses[index].chapitre}:${verses[index].num}",
                                      style: fn.style.tsHeader,
                                    ),
                                    Text(
                                      verses[index].text,
                                      softWrap: true,
                                      maxLines: ((screen.height ~/ 3 - 80) ~/ 25),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: fn.style.tsBody1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                        }
                        return Row(children: result);
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _FavoriteViewData {
  int _currentPage = 0, _currentHintPage = 0;
  static _FavoriteViewData _instance;

  factory _FavoriteViewData() {
    if (_instance == null) _instance = _FavoriteViewData._();
    return _instance;
  }

  _FavoriteViewData._();

  Future<List<Verses>> fetch({bool isFavorite = true}) async {
    assert(isFavorite != null, "`isFavorite ne doit pas etre null`");
    final db = await DbM().database;
    final result = await db.query(VersesTable.name,
        where:
            "${VersesTable.COLUMNS_favorite} = ? ${isFavorite ? '' : ' order by ${VersesTable.COLUMNS_vueCount} desc'}",
        whereArgs: isFavorite ? [1] : [0],
        limit: 12);
    return result.map((map) => Verses.fromMap(map)).toList();
  }

  final next = <Verses>[];
  void addToFavorite(Verses verse) async {
    next.add(verse);
    if (next.length > 1) return;
    verse.isFavorite = true;
    final db = await DbM().database;
    await db.update(VersesTable.name, verse.asMap(), where: "${VersesTable.COLUMNS_id} = ?", whereArgs: [verse.id]);
    next.removeAt(0);
    if (next.isNotEmpty) addToFavorite(next[0]);
  }
}
