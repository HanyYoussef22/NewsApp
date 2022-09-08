
import 'package:flutter/material.dart';
import 'package:news/Models/SourcesResponse.dart';
import 'package:news/modules/tap/TabController.dart';
import 'package:news/shard/components/constant.dart';
import 'package:news/shard/network/remote/api%20manger.dart';

class NewsScreen extends StatelessWidget {
  static const String roudeName='HomeScreen';
  String CategoryId;
  int index=0;
  NewsScreen(this.CategoryId);
  @override
  Widget build(BuildContext context) {
    return(
        FutureBuilder<SourcesResponse>(
              future: ApiManger.getSources(CategoryId),
              builder:(c,snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError)
                {
                  return Column(
                    children: [
                      Center(child: Text('Check Internet Connect'))
                    ],
                  );
                }
                if("ok"!=snapshot.data!.status)
                {
                  return Column(
                    children: [
                      Center(child: Text('Worning${snapshot.data!.message}'))

                    ],
                  );

                }
                if(snapshot.data!.message!=null)
                  {

                  }
                var SourcesList=snapshot.data?.sources ?? [];

                return TabControllerItem(SourcesList);
              },
            )
        ) ;
  }

}
