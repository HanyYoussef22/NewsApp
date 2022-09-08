import 'package:flutter/material.dart';
import 'package:news/Models/SourcesResponse.dart';
import 'package:news/modules/news/NewsDetails/NewsData.dart';

import 'tap_item.dart';

class TabControllerItem extends StatefulWidget {
List<Sources> sources;
TabControllerItem(this.sources);

  @override
  State<TabControllerItem> createState() => _TabControllerItemState();
}

class _TabControllerItemState extends State<TabControllerItem> {
int indexSelect=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index){
                indexSelect=index;
                setState((){
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources.map((OneSources) => TapItem(OneSources,
                  indexSelect==
                      widget.sources.indexOf(OneSources))).toList()
            )),
        Expanded(child: NewsData(widget.sources[indexSelect])),
      ],
    );
  }
}
