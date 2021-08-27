import 'package:calendrierbiblic/generated/l10n.dart';
import 'package:calendrierbiblic/pages/bible_translates_page.dart';
import 'package:calendrierbiblic/pages/calendrier_page.dart';
import 'package:calendrierbiblic/pages/favorites_page.dart';
import 'package:calendrierbiblic/pages/home_page.dart';
import 'package:calendrierbiblic/utils/utils.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  /// represente l'id de la page a afficher
  final String currentPageId;

  const AppDrawer({Key key, @required this.currentPageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemHome = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.dashboard, color: AppColor.menuText),
      title: Text(S.of(context).home, style: TextStyle(color: AppColor.menuText)),
      onTap: () {
        Navigator.pop(context);
        if (currentPageId != HomePage.id)
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      },
    );
    var itemCalendar = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.calendar_today, color: AppColor.menuText),
      title: Text(S.of(context).calendar, style: TextStyle(color: AppColor.menuText)),
      onTap: () {
        Navigator.pop(context);
        if (currentPageId != CalendrierPage.id)
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CalendrierPage()));
      },
    );
    var itemFavorite = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.favorite, color: AppColor.menuText),
      title: Text(S.of(context).favorites, style: TextStyle(color: AppColor.menuText)),
      onTap: () {
        Navigator.pop(context);
        if (currentPageId != FavoritePage.id)
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FavoritePage()));
      },
    );

    var itemTraductions = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.book, color: AppColor.menuText),
      title: Text(
        S.of(context).translation,
        style: TextStyle(color: AppColor.menuText),
      ),
      onTap: () {
        Navigator.pop(context);
        if (currentPageId != BibleTranslatesPage.id)
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BibleTranslatesPage()));
      },
    );
    var evaluer = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.star, color: AppColor.menuText),
      title: Text(S.of(context).evaluate, style: TextStyle(color: AppColor.menuText)),
      onTap: () {
        Navigator.pop(context);
        final rma = RateMyApp(minDays: 0, minLaunches: 0, remindDays: 3, remindLaunches: 5);
        rma.init().then((_) {
          rma.showRateDialog(context);
        });
//        openRateDialog(context);
      },
    );
    var selectLang = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.language, color: AppColor.menuText),
      title: Text(S.of(context).language, style: TextStyle(color: AppColor.menuText)),
      trailing: FutureBuilder<SharedPreferences>(
        future: fn.pref,
        builder: (ctx, snapshot) {
          return Text(
            snapshot.data == null
                ? ""
                : snapshot.data.getString(fn.KEY.lang) == "fr" ? S.of(context).french : S.of(context).english,
            style: fn.style.tsBody.withValues(color: Colors.white, fontStyle: FontStyle.italic),
          );
        },
      ),
      onTap: () async {
        final pref = (await fn.pref);
        await pref.setString(fn.KEY.lang, pref.getString(fn.KEY.lang) == "fr" ? "en" : "fr");
        await S.load(Locale(pref.getString(fn.KEY.lang)));
        fn.currentLang = pref.getString(fn.KEY.lang);
        Navigator.of(context).pop();
      },
    );
    var partager = ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Icon(Icons.share, color: AppColor.menuText),
      title: Text(S.of(context).share(""), style: TextStyle(color: AppColor.menuText)),
      onTap: () {
        Navigator.pop(context);
        Share.text(S.of(context).share(S.of(context).lapp), S.of(context).shareMsg(fn.GOOGLE_LINK), 'text/plain');
      },
    );

    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: DrawerHeader(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              S.of(context).appName,
                              style: Theme.of(context).textTheme.headline5.copyWith(color: AppColor.menuText),
                            ),
                          ),
                          decoration: BoxDecoration(color: Colors.brown.shade700))),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 69),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: itemHome,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 65),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: itemCalendar,
              ),
//              Container(
//                margin: EdgeInsets.only(left: 20, right: 69),
//                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
//                child: itemBible,
//              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 75),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: itemFavorite,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 75),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: itemTraductions,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 75),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: selectLang,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 83),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: evaluer,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 83),
                decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white10))),
                child: partager,
              )
            ],
          ),
        ),
      ),
    );
  }
}
