import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/shard/providers/app_provider.dart';
import 'package:news/shard/styles/clors.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenDetails extends StatelessWidget {
  static const String roudeName = 'ScreenDetails';
  Articles articles;

  ScreenDetails(this.articles);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: Colors.greenAccent[80],
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        backgroundColor: PrimaryColor,
        title: Text(
          provider.AppLanguage == 'en' ? 'News' : 'الاخبار',
          style: TextStyle(fontSize: 15),
        ),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(articles.urlToImage ?? '')),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${articles.source?.name ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${articles.title ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${articles.author ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${articles.publishedAt?.substring(0, 10) ?? ''}',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text('${articles.url??''}',style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 10,),textAlign: TextAlign.end,),

                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('${articles.description ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontSize: 16)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        InkWell(
                          onTap: () {
                            _launchInBrowser(Uri.parse('${articles.url}'));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  provider.AppLanguage == 'en'
                                      ? 'View Full Article'
                                      : 'مشاهدة المقال كاملاً',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 28,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
