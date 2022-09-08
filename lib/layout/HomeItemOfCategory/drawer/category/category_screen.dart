import 'package:flutter/material.dart';
import 'package:news/Models/categoryModel.dart';
import 'package:news/layout/HomeItemOfCategory/drawer/category/category_widget.dart';
import 'package:news/shard/providers/app_provider.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatelessWidget {

  var categoryes=CategoryModel.getCategoryes();

  Function onCategoryClicked;

  CategoryScreen(this.onCategoryClicked);

@override
  Widget build(BuildContext context) {
  var provider =Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15,),
          Text(provider.AppLanguage=='en'?'Pick your category of interest':'اختر فئة اهتماماتك',
            style: TextStyle(fontSize: 33,color: Colors.grey),),
          SizedBox(height: 30,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,

                ),
                itemCount: categoryes.length,
                itemBuilder: (context,index){
                return InkWell(
                    onTap: (){
                      onCategoryClicked(categoryes[index]);
                    },
                      child: CategoryWidget(categoryes[index],index)
                );
            }),
          )
        ],
      ),
    );
  }
}
