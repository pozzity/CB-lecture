import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:flutter/material.dart';

class LanguageView extends StatefulWidget {
  final void Function(BuildContext context, String local) onSave;

  const LanguageView({Key key, @required this.onSave}) : super(key: key);

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  static String _selectedLocate = "en";

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      color: Colors.brown.shade50,
      child: SingleChildScrollView(
        child: SizedBox(
          height: screen.height > 390 ? screen.height - 30 : 360,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 150,
                child: Padding(
                  padding: EdgeInsets.only(top: 50, right: 10, left: 10),
                  child: Text(
                    S.of(context).select_preferred_lang,
                    textAlign: TextAlign.center,
                    style: fn.style.tsHeader2,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 135,
                    width: 250,
                    child: DecoratedBox(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.brown.shade300.withOpacity(.5), blurRadius: 50, spreadRadius: 10)
                      ]),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.brown.withOpacity(0.5)),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    S.of(context).language,
                                    textAlign: TextAlign.left,
                                    style: fn.style.tsHeader1.withValues(color: Colors.white),
                                  ),
                                  Text(
                                    _selectedLocate == "fr" ? S.of(context).french : S.of(context).english,
                                    style:
                                        fn.style.tsBody1.withValues(fontStyle: FontStyle.italic, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await S.load(Locale("en"));
                              _selectedLocate = "en";
                              setState(() {});
                            },
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: _selectedLocate == "en"
                                        ? Colors.brown.shade200.withOpacity(0.5)
                                        : Colors.brown.shade300.withOpacity(0.7)),
                                padding: EdgeInsets.all(10),
                                child: Text("English", style: fn.style.tsBody1.withValues(color: Colors.white))),
                          ),
                          InkWell(
                            onTap: () async {
                              await S.load(Locale("fr"));
                              _selectedLocate = "fr";
                              setState(() {});
                            },
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: _selectedLocate == "fr"
                                        ? Colors.brown.shade200.withOpacity(0.5)
                                        : Colors.brown.shade300.withOpacity(0.7)),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Français",
                                  style: fn.style.tsBody1.withValues(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton.icon(
                        onPressed: () async {
                          (await fn.pref).setString(fn.KEY.lang, _selectedLocate);
                          fn.currentLang = _selectedLocate;
                          widget.onSave(context, _selectedLocate);
                        },
                        icon: Icon(
                          Icons.language,
                          color: Colors.brown,
                        ),
                        label: Text(
                          S.of(context).save,
                          style: fn.style.tsHeader,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
