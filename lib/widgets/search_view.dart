import 'package:calendrierbiblic/models/verses.dart';
import 'package:calendrierbiblic/utils/database_manager.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final keys = GlobalKey<_SearchViewState>();

  SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  static final List<Verses> data = <Verses>[];
  static String search = "";
  final ctrl = TextEditingController(text: search);
  final node = FocusNode();

  fetch(String str) async {
    search = str;
    if (str == null || str.length < 2) return [];
    final db = await DbM().database;
    data.clear();
    final result = await db.query(VersesTable.name,
        where: "${VersesTable.COLUMNS_translate_name} LIKE '%$str%' or "
            "${VersesTable.COLUMNS_livre} LIKE '%$str%' or "
            "${VersesTable.COLUMNS_text} LIKE '%$str%' ",
        groupBy:
            "${VersesTable.COLUMNS_translate_id}, ${VersesTable.COLUMNS_livre}, ${VersesTable.COLUMNS_chapitre}, ${VersesTable.COLUMNS_id}");
    data.addAll(result.map((e) => Verses.fromMap(e)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final result = Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.brown.shade200, borderRadius: BorderRadius.circular(5)),
              child: EditableText(
                  forceLine: false,
                  controller: ctrl,
                  focusNode: node,
                  style: TextStyle(fontSize: 20),
                  cursorColor: Colors.brown,
                  onSubmitted: (str) {
                    fetch(str);
                  },
                  textInputAction: TextInputAction.search,
                  backgroundCursorColor: Colors.brown),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                fetch(ctrl.text);
              })
        ],
      ),
      Expanded(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (data == null || data.length == 0)
                Text("Please write in seach box")
              else
                for (final verse in data)
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        getRichText(verse.translateName),
                        getRichText("${verse.livre} - ${verse.chapitre} - ${verse.num}"),
                        getRichText(verse.text)
                      ],
                    ),
                  )
            ],
          ),
        ),
      )
    ]);
    return result;
  }

  getRichText(String text) {
    final arr = text.split(search);
    if (arr.length == 0) return Text(text);
    return Text.rich(TextSpan(text: arr[0], children: [
      for (final str in arr..removeAt(0)) ...[
        TextSpan(text: search, style: TextStyle(backgroundColor: Colors.brown.shade300.withOpacity(0.7))),
        TextSpan(text: str)
      ]
    ]));
  }
}
