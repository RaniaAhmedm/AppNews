import 'package:app_news/model/sourcesResponse.dart';
import 'package:flutter/material.dart';

class TapItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TapItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
     decoration: BoxDecoration(
       color:isSelected?Colors.green:Colors.transparent ,
       borderRadius: BorderRadius.circular(30),
       border: Border.all(color:Colors.green,width: 3),

     ),
      child: Text(source.name??'',
      style: TextStyle(
        color: isSelected?Colors.white:Colors.green
      ),),
    );
  }
}
