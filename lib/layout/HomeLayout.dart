import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/categoryModel.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/setting/SettingScreen.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/category/category_screen.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/drawer_screen.dart';
import 'package:news/modules/news/NewsDetails/NewsDetils.dart';
import 'package:news/modules/news/news_Screen.dart';
import 'package:news/modules/news/news_item.dart';
import 'package:news/shard/network/remote/api%20manger.dart';
import 'package:news/shard/providers/app_provider.dart';
import 'package:news/shard/styles/clors.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  static const String roudeName = 'HomeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return Container(
      child: (Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30), left: Radius.circular(30))),
            backgroundColor: PrimaryColor,
            title: Text(
              provider.AppLanguage=='en'?
              'News':'الاخبار',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.start,
            ),
            actions: [
              IsselectedCategory == null
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: NewsSearchShowdelegate(

                        ));
                      },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
              SizedBox(
                width: 15,
              )
            ],

            // centerTitle: true,
          ),
          drawer: DrawerScreen(onMenuItemClicked),
          body: IsselectedCategory == null
              ? CategoryScreen(onCatgoryClicked)
              : NewsScreen(IsselectedCategory!.id))),
    );
  }

  CategoryModel? IsselectedCategory;

  onMenuItemClicked(index) {
    Navigator.pop(context);
    if (index == DrawerScreen.ISCategory) {
      IsselectedCategory = null;
      setState(() {});
    } else if (index == DrawerScreen.IsSetting) {
      Navigator.pushNamed(context, SettingScreen.roudeName);
    }
  }

  onCatgoryClicked(category) {
    // change ui body
    IsselectedCategory = category;

    setState(() {});
  }
}

class NewsSearchShowdelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(
        Icons.search,
        size: 30,
      )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },  icon: Icon(
      Icons.clear,
      size: 30,
    ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManger.getNewsBySources(quary:query ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('hasError${snapshot.hasError}');
            return Column(
              children: [

                Center(child: Text('Check Internet Connect'))

              ],
            );
          }
          if ("ok" != snapshot.data!.status) {
            return Column(
              children: [Text('Worning12313213${snapshot.data!.status}')],
            );
          }
          var ListNews = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemCount: ListNews.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder:(context)=>ScreenDetails(ListNews[index]) ));
                    },
                    child: NewsItem(ListNews[index]));
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Suggestions..!'));
  }
}
