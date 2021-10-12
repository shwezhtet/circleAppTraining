
import 'package:circleapp2/Model/DataProvider.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'LoadingPage.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
        DataProvider data = context.read<DataProvider>();

     data.loginCheck().then((result){
       if(result==true){
         data.loadAuth();
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoadingPage()));
       }else {
         Navigator.pushReplacement(
             context, MaterialPageRoute(builder: (context) => LoginPage()));
       }});
        return Scaffold(
          body: Center(
            child: Image.asset('assets/images/logo.png', width:150),
          )
        );
      }
    }
