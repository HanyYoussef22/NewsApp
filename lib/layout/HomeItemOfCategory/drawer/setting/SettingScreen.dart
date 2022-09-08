import 'package:flutter/material.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/drawer_screen.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/setting/show_language_bottomSheet.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../shard/styles/clors.dart';
import '../../../../shard/providers/app_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingScreen extends StatefulWidget {
static const String roudeName='oo';
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}
class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<AppProvider>(context);
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(30), left: Radius.circular(30))),
          backgroundColor: PrimaryColor,

          title: Text(
            provider.AppLanguage=='en'?'Setting':'الاعدادات',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.start,
          ),
          // centerTitle: true,
        ),
        body: Column(
          children: [
        Container(
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Text(
                  provider.AppLanguage=='en'?'Language':'اللغة',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black, fontSize:19 ,fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color:PrimaryColor)),
                  child: Text(
                   provider.AppLanguage=='en'?'English':'عربي',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black,fontSize:19 , fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )

          ],
        ),
        )
    ),])
    );
  }

 // void showThemeBottomSheet(){
 //    showModalBottomSheet(
 //        context: context,
 //
 //        builder: (context){
 //          return ShowThemeBottomSheet();
 //        });
 //  }
  void showLanguageBottomSheet(){
    showModalBottomSheet(
        context: context,

        builder: (context){
          return ShowLanguageBottomSheet();
        });
  }
}
