import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  NewsItem(this.articles);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15,right: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(articles.urlToImage ?? '' ,height: 180,fit: BoxFit.fill,),
          ),
          SizedBox(height: 5,),
          Text('${articles.source?.name??''}',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 10)),
          SizedBox(height: 5,),
          Text('${articles.title??''}',style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 14)),
          SizedBox(height: 5,),
          Text('${articles.author??''}',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 10)),
          SizedBox(height: 5,),
          Text('${articles.publishedAt?.substring(0,10)??''}',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 10,),textAlign: TextAlign.end,),
          SizedBox(height: 5,),


        ],
      ),
    );
  }
}
