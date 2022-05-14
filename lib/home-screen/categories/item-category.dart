import 'package:app_news/model/category.dart';
import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
  Category category;
  int index;
  Function onCategoryClicked;
  ItemCategory({required this.category, required this.index,required this.onCategoryClicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryClicked(category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.bgColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
                bottomRight: Radius.circular(index % 2 == 0 ? 0 : 24),
                bottomLeft: Radius.circular(index % 2 == 0 ? 24 : 0)),
        ),
        child: Column(children: [
          Row(
            children: [

           SizedBox(width: 14,),
              Expanded(child: Image.asset(category.image,fit: BoxFit.fill,height: 120,)),
              SizedBox(width: 14,),
            ],
          ),
          Text(category.title,style: TextStyle(color: Colors.white,fontSize: 22),),
        ],),
      ),
    );
  }
}
