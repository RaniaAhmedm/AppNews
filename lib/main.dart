import 'package:app_news/app-provider/app-proveider.dart';
import 'package:app_news/home-screen/details/screen-details.dart';
import 'package:app_news/home-screen/home_screen.dart';
import 'package:app_news/home-screen/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
void main(){
runApp(ChangeNotifierProvider(
  create: (context){
    return AppProvider();
  },
    child: MyApp()));
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          HomeScreen.routeName:(context)=>HomeScreen(),
          ScreenDetails.routeName:(context)=>ScreenDetails(),
          SettingsScreen.routeName:(context)=>SettingsScreen(),
        },
        initialRoute:HomeScreen.routeName ,
        locale: Locale(provider.appLanguage,),
          supportedLocales: [
            Locale('en'),
            Locale('ar'),
        ],
      );
  }
}
