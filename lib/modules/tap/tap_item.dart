import 'package:flutter/material.dart';
import 'package:news/Models/SourcesResponse.dart';
import 'package:news/shard/styles/clors.dart';

class TapItem extends StatelessWidget {
  bool isSelected;
  Sources sources;

  TapItem(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? PrimaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PrimaryColor,width: 2)
      ),
      child: Text('${sources.name}',style: Theme.of(context).textTheme.headline3!.copyWith(fontSize:15),),
    );
  }
}
