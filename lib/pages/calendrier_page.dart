import 'dart:async';
import 'dart:typed_data';

import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/pages/bible_translates_page.dart';
import 'package:calendrierbiblic/pages/home_page.dart';
import 'package:calendrierbiblic/utils/databaseClient.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/day.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

/// [CalendrierPage] est une [TabBarView] affichant d'un cote la liste des evenements bible,
/// de l'autre un calendrier avec des jours(ceux contenant des evenements) marquer.
///   todo : afficher le calendrier
///   todo : colorer les jours a evenement dans le calendrier.
///   todo : afficher la liste des evenements
///   todo : afficher les details d'un evenement
///   todo : naviguer ver le chapitre/verser d'un evenement
///
/// l'on peut plus tard donner a l'utilisateur la possibiliter d'agouter un evenement
/// dans le calendrier et d'etre notifier a la date dite.

class CalendrierPage extends StatefulWidget {
  static const id = "CalendrierPage";

  const CalendrierPage({Key key}) : super(key: key);

  @override
  _CalendrierPage createState() {
    return new _CalendrierPage();
  }
}

class _CalendrierPage extends State<CalendrierPage> {
  static const NOTIFICATION_CHANNEL_DESCRIPTION = "event notification";
  static const NOTIFICATION_CHANNEL_DESCRIPTION2 = "event notification2";
  static const NOTIFICATION_CHANNEL_NAME = "CB-Calendrier biblique-Pozzity";
  static const NOTIFICATION_CHANNEL_NAME2 = "CB-Calendrier biblique-Pozzity2";
  static const NOTIFICATION_CHANNEL_ID = "com.pozzity.app.calendrierbiblic.notification";
  static const NOTIFICATION_CHANNEL_ID2 = "com.pozzity.app.calendrierbiblic.notification2";
  List<Jour> days = [];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initState() {
    super.initState();
  }

  notification() async {
    await showNotification();
  }

  notificationScheduled() async {
    await showNotificationScheduled();
  }

  Future<void> showNotification() async {
    var android = AndroidNotificationDetails(
        NOTIFICATION_CHANNEL_ID, NOTIFICATION_CHANNEL_NAME, NOTIFICATION_CHANNEL_DESCRIPTION,
        priority: Priority.High, importance: Importance.High);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        12, 'Lecture du jour', 'Matthieu. 5 : 1-15 \n Jean. 6 : 14-28 \n Psaumes. 5', platform,
        payload: "first test");
  }

  Future<void> showNotificationScheduled() async {
    var time = DateTime.now().add(Duration(seconds: 15));
    var vibrationPattern = Int64List(4);
    vibrationPattern[0] = 0;
    vibrationPattern[1] = 1000;
    vibrationPattern[2] = 500;
    vibrationPattern[3] = 2000;

    var android = AndroidNotificationDetails(
        NOTIFICATION_CHANNEL_ID2, NOTIFICATION_CHANNEL_NAME2, NOTIFICATION_CHANNEL_DESCRIPTION2,
        icon: 'app_icon',
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        largeIcon: DrawableResourceAndroidBitmap('sample_large_icon'),
        vibrationPattern: vibrationPattern,
        enableLights: true,
        color: Colors.brown.shade700,
        ledColor: Colors.brown.shade700,
        ledOnMs: 1000,
        ledOffMs: 500);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.schedule(
        0, 'Lecture du jour', 'Matthieu. 5 : 1-15 \n Jean. 6 : 14-28 \n Psaumes. 5 ', time, platform,
        payload: "test 2");
  }

  _CalendrierPage() {
    DatabaseClient().allDay().then((items) {
      setState(() {
        for (int i = 0; i < items.length; i++) {
          var dat = new DateFormat('EEEEE', 'en_US').format(items[i].date);
          var dat2 = items[i].date.toString().split(' ')[0];
          var datNow = DateTime.now().toString().split(' ')[0];
          if (dat.toString() == 'Monday' && dat2 == datNow) {
            days.add(items[i]);
            days.add(items[i + 1]);
            days.add(items[i + 2]);
            days.add(items[i + 3]);
            days.add(items[i + 4]);
            days.add(items[i + 5]);
            days.add(items[i + 6]);
          } else if (dat.toString() == 'Tuesday' && dat2 == datNow) {
            days.add(items[i - 1]);
            days.add(items[i]);
            days.add(items[i + 1]);
            days.add(items[i + 2]);
            days.add(items[i + 3]);
            days.add(items[i + 4]);
            days.add(items[i + 5]);
          } else if (dat.toString() == 'Wednesday' && dat2 == datNow) {
            days.add(items[i - 2]);
            days.add(items[i - 1]);
            days.add(items[i]);
            days.add(items[i + 1]);
            days.add(items[i + 2]);
            days.add(items[i + 3]);
            days.add(items[i + 4]);
          } else if (dat.toString() == 'Thursday' && dat2 == datNow) {
            days.add(items[i - 3]);
            days.add(items[i - 2]);
            days.add(items[i - 1]);
            days.add(items[i]);
            days.add(items[i + 1]);
            days.add(items[i + 2]);
            days.add(items[i + 3]);
          } else if (dat.toString() == 'Friday' && dat2 == datNow) {
            days.add(items[i - 4]);
            days.add(items[i - 3]);
            days.add(items[i - 2]);
            days.add(items[i - 1]);
            days.add(items[i]);
            days.add(items[i + 1]);
            days.add(items[i + 2]);
          } else if (dat.toString() == 'Saturday' && dat2 == datNow) {
            days.add(items[i - 5]);
            days.add(items[i - 4]);
            days.add(items[i - 3]);
            days.add(items[i - 2]);
            days.add(items[i - 1]);
            days.add(items[i]);
            days.add(items[i + 1]);
          } else if (dat.toString() == 'Sunday' && dat2 == datNow) {
            days.add(items[i - 6]);
            days.add(items[i - 5]);
            days.add(items[i - 4]);
            days.add(items[i - 3]);
            days.add(items[i - 2]);
            days.add(items[i - 1]);
            days.add(items[i]);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendrier biblique'),
      ),
      body: (days == null || days.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.values[5],
                    image: AssetImage(
                      "assets/bible.png",
                    )),
              ),
              child: Center(
                child: Opacity(
                    opacity: 0.70,
                    child: Card(
                        child: ListView.builder(
                            itemCount: 7,
                            itemBuilder: (context, i) {
                              Jour day = days[i];
                              var date = new DateFormat('EEEEE', 'en_US').format(day.date);
                              String date2 = tradDate(date.toString());
                              var dateJour = day.date.toString().split(' ')[0];
                              var norm = normDate(dateJour);
                              List<String> verset = day.versets.split(";");
                              return GestureDetector(
                                onTap: () {
                                  List<String> passage = [];
                                  List<String> versetJour = [];
                                  List<int> longVerset = [];
                                  if (verset.length == 2) {
                                    passage.add(verset[0].split('.')[0]);
                                    versetJour.add(verset[0].split('.')[0].trim());
                                    passage.add(verset[0].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[0].split('-')[1]) != null)
//                                      print(int.parse(verset[0].split('-')[1]));
//                                    if(int.parse(verset[0].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[0].split('-')[1]));
                                    passage.add(verset[1].split('.')[0]);
                                    versetJour.add(verset[1].split('.')[0].trim());
                                    passage.add(verset[1].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(verset[0].split('-') == null)
//                                      longVerset.add(int.parse(verset[1].split('-')[1]));
                                  }
                                  if (verset.length == 3) {
                                    passage.add(verset[0].split('.')[0]);
                                    versetJour.add(verset[0].split('.')[0].trim());
                                    passage.add(verset[0].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[0].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[0].split('-')[1]));
                                    passage.add(verset[1].split('.')[0]);
                                    versetJour.add(verset[1].split('.')[0].trim());
                                    passage.add(verset[1].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[1].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[1].split('-')[1]));
                                    passage.add(verset[2].split('.')[0]);
                                    versetJour.add(verset[2].split('.')[0].trim());
                                    passage.add(verset[2].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[2].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[2].split('-')[1]));
                                  }
                                  if (verset.length == 4) {
                                    passage.add(verset[0].split('.')[0]);
                                    versetJour.add(verset[0].split('.')[0]);
                                    passage.add(verset[0].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[0].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[0].split('-')[1]));
                                    passage.add(verset[1].split('.')[0]);
                                    versetJour.add(verset[1].split('.')[0]);
                                    passage.add(verset[1].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[1].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[1].split('-')[1]));
                                    passage.add(verset[2].split('.')[0]);
                                    versetJour.add(verset[2].split('.')[0].trim());
                                    passage.add(verset[2].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[2].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[2].split('-')[1]));
                                    passage.add(verset[3].split('.')[0]);
                                    versetJour.add(verset[3].split('.')[0].trim());
                                    passage.add(verset[3].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[3].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[3].split('-')[1]));
                                  }
                                  if (verset.length == 5) {
                                    passage.add(verset[0].split('.')[0]);
                                    versetJour.add(verset[0].split('.')[0].trim());
                                    passage.add(verset[0].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[0].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[0].split('-')[1]));
                                    passage.add(verset[1].split('.')[0]);
                                    versetJour.add(verset[1].split('.')[0].trim());
                                    passage.add(verset[1].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[1].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[1].split('-')[1]));
                                    passage.add(verset[2].split('.')[0]);
                                    versetJour.add(verset[2].split('.')[0].trim());
                                    passage.add(verset[2].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[2].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[2].split('-')[1]));
                                    passage.add(verset[3].split('.')[0]);
                                    versetJour.add(verset[3].split('.')[0].trim());
                                    passage.add(verset[3].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[3].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[3].split('-')[1]));
                                    passage.add(verset[4].split('.')[0]);
                                    versetJour.add(verset[4].split('.')[0].trim());
                                    passage.add(verset[4].split('.')[1].split(':')[0].split(' ')[1]);
//                                    if(int.parse(verset[4].split('-')[1]) != null)
//                                      longVerset.add(int.parse(verset[4].split('-')[1]));
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                    notification();
                                    notificationScheduled();
                                    return LectureDuJour(
                                      title: 'Texte du Jour',
                                      versets: passage,
                                      versetJour: versetJour,
                                      longVerset: longVerset,
                                    );
                                  }));
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 100.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[Text(date2), Text(norm)],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[for (var item in verset) Text(item)],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }))),
              ),
            ),
    );
  }

  String normDate(String date) {
    var a, b, c;
    List<String> d = date.split('-');
    a = d[0];
    b = d[1];
    c = d[2];
    return c + '/' + b + '/' + a;
  }

  String tradDate(String date) {
    String d;
    if (date == "Monday")
      d = "Lundi";
    else if (date == "Tuesday")
      d = "Mardi";
    else if (date == "Wednesday")
      d = "Mercredi";
    else if (date == "Thursday")
      d = "Jeudi";
    else if (date == "Friday")
      d = "Vendredi";
    else if (date == "Saturday")
      d = "Samedi";
    else if (date == "Sunday") d = "Dimanche";

    return d;
  }
}

class LectureDuJour extends StatefulWidget {
  const LectureDuJour({Key key, this.title, this.versets, this.versetJour, this.longVerset}) : super(key: key);

  final String title;
  final List<String> versets;
  final List<String> versetJour;
  final List<int> longVerset;

  @override
  _LectureDuJour createState() {
    return _LectureDuJour();
  }
}

class _LectureDuJour extends State<LectureDuJour> with RouteAware {
  @override
  void dispose() {
    defaultRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    defaultRouteObserver.subscribe(this, ModalRoute.of(context));
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(6.0),
          child: Center(
            child: Container(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: getVerses(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    if (snapshot.data.length == 0)
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "${widget.versetJour} non trouve dans la traduction actuelle. Veuillez",
                              children: <InlineSpan>[
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => HomePage(tabIndex: 1)));
                                      },
                                      child: Text(
                                        " selectionner ",
                                        style: fn.style.tsHeader2.withValues(
                                            fontStyle: FontStyle.italic,
                                            decoration: TextDecoration.underline,
                                            color: Colors.brown.shade900),
                                      ),
                                    )),
                                TextSpan(
                                  text: 'ou',
                                ),
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BibleTranslatesPage(
                                                      afterDownload: (ctx) {
                                                        Navigator.pop(ctx);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => HomePage(
                                                                      tabIndex: 1,
                                                                    )));
                                                      },
                                                    )));
                                      },
                                      child: Text(
                                        " telecharger ",
                                        style: fn.style.tsHeader2.withValues(
                                            fontStyle: FontStyle.italic,
                                            decoration: TextDecoration.underline,
                                            color: Colors.brown.shade900),
                                      ),
                                    )),
                                TextSpan(
                                  text: "la traduction adequate",
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            style: fn.style.tsHeader2.withValues(color: Colors.brown),
                          )
                        ],
                      );
                    final List<Map<String, dynamic>> classementsVerses = [];
                    for (int i = 0; i < widget.versetJour.length; i++) {
                      classementsVerses.add({"chapitre": widget.versetJour[i], "verses": []});
                    }
                    snapshot.data.map((data) {
                      final ver = Verses.fromMap(data);
                      for (int i = 0; i < widget.versetJour.length; i++) {
                        if (ver.livre.toString() == fn.bookNameToFr(widget.versetJour[i].toString())) {
                          classementsVerses[i]['verses'].add(ver);
                        }
                      }
//                      print(classementsVerses);
                    }).toList();

                    return SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            for (int i = 0; i < widget.versetJour.length; i++)
                              classementsVerses[i]["verses"].length > 0
                                  ? Column(
                                      children: <Widget>[
                                        Text(
                                          "${widget.versetJour[i]} ${classementsVerses[i]["verses"][0].chapitre}",
                                          style: TextStyle(fontSize: 25.0),
                                        ),
                                        for (int j = 0; j < classementsVerses[i]["verses"].length; j++)
                                          Text("Verset ${j + 1} : ${classementsVerses[i]["verses"][j].text}\n",
                                              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 19))
                                      ],
                                    )
                                  : Container(
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "Le livre `${classementsVerses[i]["chapitre"]}` n'a pas ete trouvee dans la "
                                        "traduction par defaut actuelle. Veuillez selectionner ou telecharger "
                                        "la traduction adhequoite",
                                        style: TextStyle(color: Colors.red.shade700, fontSize: 17),
                                      ),
                                    )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ));

    // TODO: implement build
  }

  Future<List<Map<String, dynamic>>> getVerses() async {
    List<Map<String, dynamic>> responseFinal = [];
    var db = await DbM().database;
    if (widget.versetJour.length == 2) {
      String a, b;
      a = fn.bookNameToFr(widget.versets[0]);
      b = fn.bookNameToFr(widget.versets[2]);
      List<Map<String, dynamic>> response1 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, a, int.parse(widget.versets[1])]);

      List<Map<String, dynamic>> response2 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, b, int.parse(widget.versets[3])]);
      for (var item in response1) responseFinal.add(item);
      for (var item in response2) responseFinal.add(item);
    } else if (widget.versetJour.length == 3) {
      String a, b, c;
      a = fn.bookNameToFr(widget.versetJour[0]);
      b = fn.bookNameToFr(widget.versetJour[1]);
      c = fn.bookNameToFr(widget.versetJour[2]);
      List<Map<String, dynamic>> response1 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, a, int.parse(widget.versets[1])]);

      List<Map<String, dynamic>> response2 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, b, int.parse(widget.versets[3])]);

      List<Map<String, dynamic>> response3 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, c, int.parse(widget.versets[5])]);
      for (var item in response1) responseFinal.add(item);

      for (var item in response2) responseFinal.add(item);

      for (var item in response3) responseFinal.add(item);
    } else if (widget.versetJour.length == 4) {
      String a, b, c, d;
      a = fn.bookNameToFr(widget.versetJour[0]);
      b = fn.bookNameToFr(widget.versetJour[1]);
      c = fn.bookNameToFr(widget.versetJour[2]);
      d = fn.bookNameToFr(widget.versetJour[3]);
      List<Map<String, dynamic>> response1 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, a, int.parse(widget.versets[1])]);

      List<Map<String, dynamic>> response2 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, b, int.parse(widget.versets[3])]);

      List<Map<String, dynamic>> response3 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, c, int.parse(widget.versets[5])]);

      List<Map<String, dynamic>> response4 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, d, int.parse(widget.versets[7])]);

      for (var item in response1) responseFinal.add(item);

      for (var item in response2) responseFinal.add(item);

      for (var item in response3) responseFinal.add(item);

      for (var item in response4) responseFinal.add(item);
    } else if (widget.versetJour.length == 5) {
      String a, b, c, d, e;
      a = fn.bookNameToFr(widget.versetJour[0]);
      b = fn.bookNameToFr(widget.versetJour[1]);
      c = fn.bookNameToFr(widget.versetJour[2]);
      d = fn.bookNameToFr(widget.versetJour[3]);
      e = fn.bookNameToFr(widget.versetJour[4]);
      List<Map<String, dynamic>> response1 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, a, int.parse(widget.versets[1])]);

      List<Map<String, dynamic>> response2 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [fn.currentTranslateName, b, int.parse(widget.versets[3])]);

      List<Map<String, dynamic>> response3 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [c, int.parse(widget.versets[5])]);

      List<Map<String, dynamic>> response4 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [d, int.parse(widget.versets[7])]);

      List<Map<String, dynamic>> response5 = await db.query(Verses.ID,
          columns /*optional*/ : [
            VersesTable.COLUMNS_chapitre,
            VersesTable.COLUMNS_livre,
            VersesTable.COLUMNS_id,
            VersesTable.COLUMNS_text
          ],
          where:
              "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ?",
          whereArgs: [e, int.parse(widget.versets[7])]);
      for (var item in response1) responseFinal.add(item);

      for (var item in response2) responseFinal.add(item);

      for (var item in response3) responseFinal.add(item);

      for (var item in response4) responseFinal.add(item);

      for (var item in response5) responseFinal.add(item);
    }
    return responseFinal;
  }
}
