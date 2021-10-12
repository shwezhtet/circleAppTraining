//this is for inserting Image link and Text

import 'dart:core';
import 'package:flutter/material.dart';
import '../Controller/post.dart';

class SendTextImg extends StatefulWidget {
  const SendTextImg({Key key}) : super(key: key);

  @override
  _SendTextImgState createState() => _SendTextImgState();
}

class _SendTextImgState extends State<SendTextImg> {
  String username;
  String userimage;
  String posttext;
  String postimage;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar (
            title: Text('Inserting Text and Image'),
          ),
          body: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter Username'),
                onChanged: (text){username = text;},
              ),
              TextField(

                decoration: InputDecoration(hintText: 'Enter User image link'),
                onChanged: (text){userimage = text;},
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter Post Text'),
                onChanged: (text){posttext = text;},
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter Post Image Link'),
                onChanged: (text){postimage = text;},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                ),
                onPressed: (){
                  //print (username);
                  //print(userimage);
                  //print(posttext);
                  //print(userimage);

                  Map json = {
                    'username' : username,
                    'userimage': userimage,
                    'posttext' : posttext,
                    'postimage': postimage,
                  };
                  print (json);
//insertPost(json); <only need this as Stanley taught>
                  insertPost(json).then((value) {
                    print (value.posttext);
                  });

                },
                child: Text('Insert Data'),
              ),
            ],
          ),
        )
    );
  }
}



