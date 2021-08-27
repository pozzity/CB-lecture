import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/pages/bible_translates_page.dart';
import 'package:calendrierbiblic/pages/livres_page.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/firebase.dart' show FbUtils;
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:calendrierbiblic/widgets/menu_drawer.dart';
import 'package:calendrierbiblic/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'favorites_page.dart';

final RouteObserver<PageRoute> defaultRouteObserver = RouteObserver<PageRoute>();

///
/// Represente la page d'acceuil de l'application et contient :
///   todo: afficher une sugestion des verses en fonction des evenement du jour
///   todo: afficher une liste non exautive de meilleur favoris
///   todo: afficher une historique incomplet des verse lu
///   todo: afficher le calendrier(horaire) du Jour
///   todo: afficher le menu
///
/// // stores ExpansionPanel state information
///
class HomePage extends StatefulWidget {
  static const id = "HomePage";
  final int tabIndex;

  const HomePage({
    Key key,
    this.tabIndex,
  }) : super(key: key);

  @override
  HomeState createState() => HomeState()
    .._selectedIndex = tabIndex ?? 0
    .._prevIndex = tabIndex ?? 0;
}

class HomeState extends State<HomePage> with RouteAware {
  int _selectedIndex = 0, _prevIndex = 0;
  List<Map<String, dynamic>> _allVerses;
  List<Map<String, dynamic>> _allTraductions;
  String defaultTraduction;
  bool _backChange = true;

  BuildContext _scaffoldContext;

  Future<bool> get tryAlertEmptyTranslate async {
    bool response = false;
    if (_allTraductions == null || _allTraductions.length == 0) {
      response = true;
      await showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text(S.of(context).no_translation),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text(S.of(context).download_least_one_translate),
                    ],
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    textColor: Colors.brown.shade900,
                    child: Text(S.of(context).ok),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => BibleTranslatesPage(
                          afterDownload: (ctx) => Navigator.pop(ctx),
                        ),
                      ));
                    },
                  ),
                ],
              ));
        },
      );
    }
    return response;
  }

  Future<void> getData() async {
    final db = await DbM().database;
    List<Map<String, dynamic>> listVerses;
    if (defaultTraduction == '') {
      listVerses = await db.query(Verses.ID, columns: [VersesTable.COLUMNS_livre], distinct: true);
    } else {
      listVerses = await db.query(Verses.ID,
          columns: [VersesTable.COLUMNS_livre],
          distinct: true,
          where: "(${VersesTable.COLUMNS_translate_name} = ?)",
          whereArgs: [defaultTraduction]);
    }
    _allVerses = listVerses ?? [];
  }

  Future<void> getDefaultTraduction() async {
    final db = await DbM().database;
    final listTraductions = await db.query(Verses.ID, columns: [VersesTable.COLUMNS_translate_name], distinct: true);
    _allTraductions = listTraductions ?? [];
    if (_allTraductions.length > 0) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      defaultTraduction = prefs.getString('defaultTraduction');
      if (defaultTraduction == null) defaultTraduction = _allTraductions[0][VersesTable.COLUMNS_translate_name];
      fn.currentTranslateName = defaultTraduction;
    }
  }

  setDefaultTraduction(String dft) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('defaultTraduction', dft);
    setState(() {
      _backChange = true;
    });
  }

  Future<void> delTraduction(String traduction) async {
    final db = await DbM().database;
    await db.rawDelete(
        'DELETE FROM ' + VersesTable.name + ' WHERE ' + VersesTable.COLUMNS_translate_name + ' = ?', [traduction]);
    setState(() {
      _backChange = true;
    });
  }

  Future<void> showDialogDeleteTraduction(String traduction) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).confirm_delete),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(S.of(context).really_want_it),
                Text('$traduction?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Colors.red,
              child: Text(S.of(context).delete),
              onPressed: () async {
                await delTraduction(traduction);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              textColor: Colors.black,
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    if (index == 4) {
      Scaffold.of(_scaffoldContext).openEndDrawer();
      _selectedIndex = _prevIndex;
      return;
    }
    _prevIndex = index;
    tryAlertEmptyTranslate.then((alertShowed) {
      if (!alertShowed)
        setState(() {
          _selectedIndex = index;
        });
    });
  }

  Widget _scaffoldResult({Widget body}) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      endDrawer: WillPopScope(
          onWillPop: () async {
            print("Drawer will pop");
            return false;
          },
          child: AppDrawer(currentPageId: HomePage.id)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text("bible"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text(S.of(context).translation),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(S.of(context).favorites),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text('Menu'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown.shade700,
        unselectedItemColor: Colors.brown.shade300,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            _scaffoldContext = context;
            return body;
          },
        ),
      ),
    );
  }

  Widget _bibleView() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ListView.builder(
        itemCount: _allVerses.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _allVerses[index][VersesTable.COLUMNS_livre];
          return new Card(
            elevation: 2.0,
            color: Colors.brown.shade300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    '${fn.bookNameOnCurrentLang(context, item)}',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LivresPage(),
                        settings: RouteSettings(
                          arguments: {"index": index, "traduction": defaultTraduction, "livre": item},
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _translateView() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(S.of(context).you_have_x_translation(_allTraductions.length, _allTraductions.length > 1 ? "s" : ""),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Expanded(
              child: ListView.builder(
                itemCount: _allTraductions.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _allTraductions[index][VersesTable.COLUMNS_translate_name];
                  Map elt = Map();
                  elt['translateName'] = _allTraductions[index][VersesTable.COLUMNS_translate_name];

                  InkWell actionDefaultTraduction = InkWell(
                    onTap: () async {
                      await setDefaultTraduction('${elt['translateName']}');
                    },
                    child: Text(
                      S.of(context).mark_as_principal,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  );

                  if (item == defaultTraduction) {
                    actionDefaultTraduction = InkWell(
                      onTap: () async {},
                      child: Text(
                        S.of(context).def,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    );
                  }

                  return Card(
                    color: Colors.brown.shade300,
                    margin: EdgeInsets.all(5.0),
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            '${elt['translateName']}',
                            style: TextStyle(color: Colors.white, fontSize: 14.0),
                          ),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                showDialogDeleteTraduction('${elt['translateName']}');
                              },
                              child: Text(
                                S.of(context).delete,
                                style: TextStyle(color: Colors.red, fontSize: 14.0),
                              ),
                            ),
                            actionDefaultTraduction
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => BibleTranslatesPage(
                              afterDownload: (ctx) {
                                Navigator.pop(ctx);
                              },
                            )));
              },
              label: Text(S.of(context).add_translation),
              icon: Icon(Icons.add),
              backgroundColor: Colors.brown.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _viewOfCurrentIndex {
    return [_bibleView(), _translateView(), SearchView(), FavoriteView()].elementAt(_selectedIndex);
  }

  Future<void> fetch() async {
    if (!_backChange) return;
    _backChange = false;
    await getDefaultTraduction();
    if (defaultTraduction != null) await getData();
    await tryAlertEmptyTranslate;
  }

  @override
  Widget build(BuildContext context) {
    FbUtils().setCurrentScreen(screenName: HomePage.id);
    return _scaffoldResult(
      body: FutureBuilder(
        future: fetch(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          if (_allTraductions != null && _allTraductions.length > 0) return _viewOfCurrentIndex;
          return Container();
        },
      ),
    );
  }

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
    setState(() {
      _backChange = true;
    });
  }
}
