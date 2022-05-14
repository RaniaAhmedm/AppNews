import 'package:app_news/home-screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app-provider/app-proveider.dart';
import 'lang-sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings Screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
            setState(() {});
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        backgroundColor: Color.fromRGBO(57, 165, 82, 1.0),
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(13),
                child: Text(
                  AppLocalizations.of(context)!.language,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(57, 165, 82, 1.0),
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.all(16),
              child: InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguage=='en'?'English':'العربية',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(57, 165, 82, 1.0),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: Color.fromRGBO(57, 165, 82, 1.0),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showLanguageBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }
}
