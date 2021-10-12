import 'package:flutter/material.dart';
import 'package:circleapp2/Model/Post.dart';
import 'package:circleapp2/Controller/comment.dart';
import 'package:circleapp2/Model/DataProvider.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatelessWidget {
  Post post;
  String commenttext;

  CommentPage({this.post});

  @override
  Widget build(BuildContext context) {
    DataProvider data = context.read<DataProvider>();
    DataProvider _data = context.watch<DataProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('comment'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        // A fixed-height child.
                        height: 120.0,
                        alignment: Alignment.center,
                        child: ListView(
                          children: List.generate(
                              post.comments.length, (index) {
                            return post.comments[index].renderTile(context);
                          }),
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xffee0000), // Red
                      height: 90.0,
                      alignment: Alignment.center,
                      child: Container(
                        child: Row(children: [
                          Container(
                            width: 300.0,
                            child: TextField(
                              onChanged: (value) {
                                commenttext = value;
                              },
                              decoration: InputDecoration(
                                  labelText: 'comment',
                                  border: OutlineInputBorder()
                              ),
                            ),
                          ),
                          IconButton(icon: Icon(Icons.send), onPressed: () {
                            Map json = {
                              "postid": post.id,
                              "commenttext": commenttext,
                            };
                            insertComment(json).then((result) {
                              data.CommentGotPosted(result);
                            });
                          }),
                        ],),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


