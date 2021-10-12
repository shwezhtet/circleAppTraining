import 'dart:io';
import 'package:circleapp2/Controller/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:circleapp2/Model/DataProvider.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File _image;
  String posttext;
  //String username;
  final picker = ImagePicker();



  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider data = context.read<DataProvider>();
    DataProvider _data = context.watch<DataProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: _image == null
                  ? Text('No image selected.')
                  : Container(height: 100, width: 100, child: Image.file(_image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 80, width: 300,
                child: TextField(
                  onChanged: (value){
                    posttext = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  )
                ),
            )
          ),
          ElevatedButton(
              onPressed: getImageFromCamera,
              child: Text('From Camera')
          ),
          ElevatedButton(
              onPressed: getImageFromGallery,
              child: Text('From Gallery')
          ),
          ElevatedButton(onPressed: (){

            Map json = {
              'posttext': posttext,
              'file': _image.path,
          };
            //print(json);
              insertPostWithImage(json).then((result){
            //data.newsfeed.posts.add(result);
            data.PostGotInserted(result);
            Navigator.pop(context);
                  });
                },
            child: Text('Create Post'),
          ),
        ],
      ),
    );
  }
}







//import 'dart:convert';
//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:circleapp2/Controller/post.dart';
//import 'package:circleapp2/Model/DataProvider.dart';
//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter/foundation.dart';


/*class AddDataWimage extends StatefulWidget {
  @override
  _AddDataWimageState createState() => _AddDataWimageState();
}
class _AddDataWimageState extends State<AddDataWimage> {
  File image1,image2;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _posttextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    DataProvider data = context.read<DataProvider>();
    DataProvider _data = context.watch<DataProvider>();
    return Scaffold(
          appBar: AppBar(backgroundColor: Colors.deepPurple,
            title: const Text('Creating new post'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                image1 != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.file(
                    image1,
                    width: 30,
                    height: 30,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  child: Text('img 1'),
                ),
                FlatButton(
                  child: Text("Pick a user image"),
                  onPressed: () async {
                    var pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
                    setState(()  {
                      image1 = File(pickedImage.path);
                    });
                  },
                ),

                image2 != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.file(
                    image2,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                )
                    : Container(
                  child: Text('img 2'),
                ),

                FlatButton(
                  child: Text("Pick an Post image"),
                  onPressed: () async {
                    var pickedImage = await ImagePicker().getImage(source: ImageSource.camera);
                    setState(()  {
                      image2 = File(pickedImage.path);
                    });
                  },
                ),

                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(hintText: 'Enter Username'),

                  //onChanged: (text){username = text;},
                ),
                TextField(
                  controller: _posttextController,
                  decoration: InputDecoration(hintText: 'Enter Posttext'),
                  //onChanged: (text){username = text;},
                ),

                FlatButton(
                  child: Text("Send"),
                  onPressed: () {
                    //print(posttext);//can test here
                    //(_image.path);
                    Map json = {
                      'username' : _usernameController.text,
                      'posttext' : _posttextController.text,
                      'numlikes' :'78',
                      'numcomments': '65',
                      'userimage': image1.path,
                      'postimage': image2.path,
                    };

                    insertPostWithImage(json).then((result) {

                    data.SomethingChange(result);

                    });

                    //sendRequest(json);

                  },
                ),
              ],
            ),
          ),
    );
  }
}
*/






