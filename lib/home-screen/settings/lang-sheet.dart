import 'package:app_news/app-provider/app-proveider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeAppLanguage('en');
                Navigator.pop(context);
              },
              child:
                  selectedLanguageRow('English', provider.appLanguage == 'en')),
          InkWell(
              onTap: () {
                provider.changeAppLanguage('ar');
                Navigator.pop(context);
              },
              child:
                  selectedLanguageRow('العربية', provider.appLanguage == 'ar')),
        ],
      ),
    );
  }

  Widget selectedLanguageRow(String lang, bool isSelected) {
    if (isSelected) {
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$lang',
              style: TextStyle(
                  fontSize: 20, color:Color.fromRGBO(57, 165, 82, 1.0),),
            ),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
      );
    } else
      return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$lang',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
  }
}
