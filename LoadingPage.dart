
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:circleapp2/Model/DataProvider.dart';
import 'package:circleapp2/Pages/HomePage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    DataProvider data = context.read<DataProvider>(); //<most things need reader>
    DataProvider _data  = context.watch<DataProvider>(); //<watcher even change for small thing>

    data.Loadnewsfeed().then((result){
      Navigator.pushReplacement (context, MaterialPageRoute(builder: (context) =>HomePage()));
    });

    return Scaffold(
        body:Center(
        child: CircularProgressIndicator(),

      ),
    );
  }
}
