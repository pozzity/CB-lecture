import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/firebase.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';

class VersesPage extends StatefulWidget {
  static const id = "VersesPage";
  @override
  VersesState createState() => VersesState();
}

class VersesState extends State<VersesPage> {
  final List<Verses> _allVerses = [];
  Map<String, dynamic> params;

  Future<void> getData() async {
    final db = await DbM().database;
    List<Map<String, dynamic>> listLivres = await db.query(VersesTable.name,
        where:
            "${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? AND ${VersesTable.COLUMNS_chapitre} = ? ORDER BY ${VersesTable.COLUMNS_num} ASC",
        whereArgs: [params["traduction"], params["livre"], params["chapitre"]]);
    setState(() {
      _allVerses.addAll(listLivres.map((e) => Verses.fromMap(e)));
    });
  }

  Future<int> setFavoris(Verses v) async {
    v.isFavorite = !v.isFavorite;
    final db = await DbM().database;
    int updateFav =
        await db.update(VersesTable.name, v.asMap(), where: "${VersesTable.COLUMNS_id} = ?", whereArgs: [v.id]);
    return updateFav;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    params = ModalRoute.of(context).settings.arguments as Map;
    assert(params != null, "No params found in Current route");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    FbUtils().setCurrentScreen(screenName: VersesPage.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${fn.bookNameOnCurrentLang(context, params["livre"])} ${params["chapitre"]}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: simpleTest(),
    );
  }

  Widget simpleTest() {
    return Scaffold(
      body: new ListView.builder(
        itemCount: _allVerses.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _allVerses[index];
          updateViewCount(item);
          return new Card(
            margin: EdgeInsets.all(5.0),
            color: Colors.brown.withOpacity(0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: item.isFavorite
                      ? new Icon(
                          Icons.favorite,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                  title: Text(
                    '${S.of(context).verse} ${item.num}',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  subtitle: Text(
                    '${item.text}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                  onTap: () async {
                    await setFavoris(item);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void updateViewCount(Verses verse) async {
    final db = await DbM().database;
    await db.update(VersesTable.name, verse.asMap()..[VersesTable.COLUMNS_vueCount] = verse.vueCount + 1,
        where: "${VersesTable.COLUMNS_id} = ?", whereArgs: [verse.id]);
  }
}
