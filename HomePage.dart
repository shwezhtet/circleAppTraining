import 'dart:async';
import 'package:circleapp2/Controller/post.dart';
import 'package:circleapp2/Model/Authentication.dart';
import 'package:circleapp2/Model/DataProvider.dart';
import 'package:circleapp2/Pages/StartPage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import '../Model/Post.dart';
import 'package:flutter/material.dart';
import 'CreatePostPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DataProvider data;
  DataProvider _data;
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    data = context.read<DataProvider>();
    _data = context.watch<DataProvider>();


      return Scaffold(
        appBar: AppBar(
          title: Text(data.auth.username),
          actions: [
            IconButton(icon: Icon(Icons.logout), onPressed: (){
              Authentication.remove();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>StartPage()));

            })
          ],
        ),
          body: Center(
            child: ListView(
              children: List.generate(_data.newsfeed.posts.length, (index){
                return _data.newsfeed.posts[index].renderCard(context);
              }),
            ),
          ),

      floatingActionButton: FloatingActionButton (
    child: Icon(Icons.add, color: Colors.white,  size: 29,),
    backgroundColor: Colors.deepPurple,
    onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CreatePostPage()),
    );},),
      );
    }
  }


  /*class PostCard extends StatelessWidget {
    Post post;
    PostCard({this.post});

    @override
    Widget build(BuildContext context) {
      return Card(elevation: 7,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
        child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(
                    post.userimage),),
                title: Text(post.username),
                subtitle: Text(post.createdAt.toString(),),
                //dense: true,
                trailing: Icon(
                  Icons.more_vert, color: Colors.deepPurple,),
              ),
              Padding(
                padding: const EdgeInsets.all(0.1),
                child: Text(post.posttext,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 280.0,
                height: 180.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(post.postimage)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(flex: 1),

                  Icon(Icons.favorite, color: Colors.deepPurple,),
                  //Text(_newsfeed.posts[i].numlikes.toString()), //can use this way too
                  Text('${post.numlikes}'),
                  Spacer(flex: 1),
                  Icon(Icons.chat, color: Colors.deepPurple,),
                  Text('${post.numcomments}'),
                  Spacer(flex: 3),
                  Icon(Icons.share, color: Colors.deepPurple,),
                  Spacer(flex: 1,),
                ],
              ),
              SizedBox(height: 10),
            ]
        ),
      );
    }
  }


  Widget renderNewsFeed(Posts _newsfeed) {
    return ListView(

    );
  }

*/



