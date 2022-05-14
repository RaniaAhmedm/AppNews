// ignore_for_file: deprecated_member_use

import 'package:app_news/model/NewsResponse.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenDetails extends StatelessWidget {
  static const String routeName = 'Details Screen';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(57, 165, 82, 1.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        centerTitle: true,
        title: Text('News Details'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 200,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: args.urlToImage == null
                        ? Icon(Icons.broken_image)
                        : Image.network(
                            args.urlToImage ?? '',
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    args.author ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    args.title ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    args.publishedAt ?? '',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                args.content ?? '',
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
             InkWell(
               onTap: (){
                 launchURL(args.url??'');
               },
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View all articles',style: TextStyle(
                      fontWeight: FontWeight.bold,),
                  ),
                  Icon(Icons.arrow_right,size: 30,)
                ],
            ),
             )
         
          ],
        ),
      ),
    );
  }
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
