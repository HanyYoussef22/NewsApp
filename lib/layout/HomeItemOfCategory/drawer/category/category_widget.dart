import 'package:flutter/material.dart';
import 'package:news/Models/categoryModel.dart';
class CategoryWidget extends StatelessWidget {
  CategoryModel categorys;
  int index;
  CategoryWidget(this.categorys,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categorys.ColorCode
            ,borderRadius: BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        bottomRight:Radius.circular(index%2==0? 0:25),
        bottomLeft:Radius.circular(index%2!=0? 0:25),
      )
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categorys.image),
          SizedBox(height: 10,),
          Text(categorys.titel),

        ],
      ),
    );
  }
}
