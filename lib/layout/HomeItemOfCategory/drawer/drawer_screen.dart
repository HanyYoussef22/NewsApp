import 'package:flutter/material.dart';
import 'package:news/layout/HomeLayout.dart';
import 'package:news/shard/providers/app_provider.dart';
import 'package:news/shard/styles/clors.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  Function onMenuItemClicked;
  static int ISCategory=1;
  static int IsSetting=2;
  DrawerScreen(this.onMenuItemClicked);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: WhiteColor, borderRadius: BorderRadius.circular(12)),
        width: MediaQuery.of(context).size.width * 0.65,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: PrimaryColor, borderRadius: BorderRadius.circular(12)),
              height: MediaQuery.of(context).size.height * 0.10,
              width: double.infinity,
              child: Center(
                child: Text(
                  provider.AppLanguage=='en'?
                  'News App':'تطيق الاخبار',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                onMenuItemClicked(ISCategory);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.list),
                    SizedBox(
                      width: 10,
                    ),
                    Text( provider.AppLanguage=='en'?
                    'Category':'الفئات',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                onMenuItemClicked(IsSetting);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      provider.AppLanguage=='en'?
                      'Setting':'الاعدادات',

                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




