import 'package:app_news/home-screen/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeSideMenu extends StatefulWidget {
  static const String settings = 'Settings';
  static const String categories = 'Categories';
  Function onItemClicked;
  HomeSideMenu({required this.onItemClicked});
  @override
  State<HomeSideMenu> createState() => _HomeSideMenuState();
}
class _HomeSideMenuState extends State<HomeSideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .08,
              bottom: MediaQuery.of(context).size.height * .03,
            ),
            color: Color.fromRGBO(57, 165, 82, 1.0),
            child: Text(
              'News App!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              widget.onItemClicked(HomeSideMenu.categories);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
                  child: Icon(
                    Icons.list_outlined,
                    size: 26,
                  ),
                ),
                Text(AppLocalizations.of(context)!.categories,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          InkWell(
            onTap: (){
              // onItemClicked(settings);
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                  child: Icon(
                    Icons.settings,
                    size: 26,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
