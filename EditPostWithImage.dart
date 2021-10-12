import 'dart:io';
import 'package:circleapp2/Controller/post.dart';
import 'package:circleapp2/Model/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:circleapp2/Model/DataProvider.dart';

class EditPostWithImage extends StatefulWidget {
  Post post;
  EditPostWithImage({@required this.post});

  @override
  _EditPostWithImageState createState() => _EditPostWithImageState();
}

class _EditPostWithImageState extends State<EditPostWithImage> {
  File _image;
  String posttext;
  String postimage;
  final picker = ImagePicker();


  @override
  void initState(){
    posttext = widget.post.posttext;
    postimage =widget.post.postimage;
    super.initState();
  }


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
        title: Text('Image Picker with Edit'),
      ),
      body: Column(
        children: [
          Container(
            child:  Center(
              child:
           _image != null?
      Container(height: 100, width: 100, child: Image.file(_image)):
        widget.post.postimage!= '' ?
                 Container(child: Image.network(widget.post.postimage, width:100, height:100,)):
                      Text('Image Selected')

             // _image == null
               //   ? Text('No image selected.')
               //   : Container(height: 100, width: 100, child: Image.file(_image)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 80, width: 300,
                child: TextFormField(
                  initialValue: widget.post.posttext,
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
              'postid': widget.post.id,
              'posttext': posttext,
              'file': _image.path,
              'postimage': postimage,
            };
            //print(json);
            updatePostWithImage(json).then((result){
              //data.newsfeed.posts.add(result);
              data.PostGotInserted(result);//need to work on this one for our own or next week
              Navigator.pop(context);
            });
          },
            child: Text('Update Post'),
          ),
        ],
      ),
    );
  }
}
