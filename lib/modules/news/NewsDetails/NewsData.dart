import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/SourcesResponse.dart';
import 'package:news/modules/news/NewsDetails/NewsDetils.dart';
import 'package:news/modules/news/news_item.dart';
import 'package:news/shard/network/remote/api%20manger.dart';

class NewsData extends StatelessWidget {
  Sources Newsources;

  NewsData(this.Newsources);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManger.getNewsBySources(sourceId: Newsources.id ?? ""),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('hasError${snapshot.hasError}');
            return Column(
              children: [Text('${snapshot.data?.status}')],
            );
          }
          if ("ok" != snapshot.data!.status) {
            return Column(
              children: [Text('Worning${snapshot.data!.status}')],
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
}
