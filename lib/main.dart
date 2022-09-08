import 'package:flutter/material.dart';
import 'package:news/layout/HomeLayout.dart';
import 'package:news/shard/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'layout/HomeItemOfCategory/drawer/setting/SettingScreen.dart';

void main() async{
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);

    return  MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // Spanish, no country code
      ],

     initialRoute:
     HomeLayout.roudeName,
      routes: {
       HomeLayout.roudeName:(_)=>HomeLayout(),
        SettingScreen.roudeName:(_)=>SettingScreen()
      },
      locale: Locale(provider.AppLanguage),
      debugShowCheckedModeBanner: false,
    );
  }
}
