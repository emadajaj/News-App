import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget singleNew(article){
  return Row(children: [
    Container(
        width: 120,
        height: 120,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}')
          )
        ),
        ),
    SizedBox(width: 20,),
    Expanded(
      child: Container(
        height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text('${article['title']}',style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 17,
                color: Colors.black87,
              ),maxLines: 2,
              overflow: TextOverflow.ellipsis,),
            ),
            //SizedBox(height: 20,),
            Text('${article['publishedAt']}',style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ))
          ],
        ),
      ),
    ),

],);}


// url : https://newsapi.org/
// method : v2/top-headlines?
// qu : country=eg&category=business&apikey=b3e25db2a58f4be3ac9553c6ffdacb5a