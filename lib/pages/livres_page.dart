import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/pages/verses_page.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:calendrierbiblic/utils/firebase.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';

class LivresPage extends StatefulWidget {
  static const id = "LivresPage";
  @override
  LivresState createState() => LivresState();
}

class LivresState extends State<LivresPage> {
  List<Map<String, dynamic>> _allChapitres = [];
  Map dataC;

  Future<void> getData() async {
    String sql =
        'SELECT DISTINCT ${VersesTable.COLUMNS_chapitre} FROM ${Verses.ID} WHERE ${VersesTable.COLUMNS_translate_name} = ? AND ${VersesTable.COLUMNS_livre} = ? ORDER BY ${VersesTable.COLUMNS_chapitre} ASC';
    final db = await DbM().database;
    List<Map<String, dynamic>> listLivres = await db.rawQuery(sql, [dataC["traduction"], dataC["livre"]]);
    setState(() {
      _allChapitres = listLivres ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    this.dataC = ModalRoute.of(context).settings.arguments as Map;
    assert(this.dataC != null, "No params has been passed");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    FbUtils().setCurrentScreen(screenName: LivresPage.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(fn.bookNameOnCurrentLang(context, dataC["livre"])),
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
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 5,
          children: List.generate(
            _allChapitres.length,
            (index) {
              final item = _allChapitres[index][VersesTable.COLUMNS_chapitre];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => VersesPage(),
                      settings: RouteSettings(
                        arguments: {
                          "index": index,
                          "traduction": dataC["traduction"],
                          "livre": dataC["livre"],
                          "chapitre": item
                        },
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.brown.withOpacity(0.6), blurRadius: 2.0)],
                        borderRadius: BorderRadius.all(Radius.circular(1.0))),
                    child: Text(
                      '$item',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
