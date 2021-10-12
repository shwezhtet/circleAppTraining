import 'package:circleapp2/Controller/authentication.dart';
import 'package:circleapp2/Controller/login.dart';
import 'package:circleapp2/Model/Authentication.dart';
import 'package:circleapp2/Model/DataProvider.dart';
import 'package:circleapp2/Pages/LoadingPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DataProvider data;
  DataProvider _data;

  String useremail;
  String userpassword;
  String errormessage= '';


  Widget build(BuildContext context) {
    data = context.read<DataProvider>();
    _data = context.watch<DataProvider>();

    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(child: Container()),
        Container(
          width: 150,
          height: 150,
          child: Image.asset('assets/images/logo.png'),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 10, 50, 8),
          child: TextField(
            onChanged: (value){useremail=value;},
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                hintText: 'User Id'),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
          child: TextField(
            onChanged: (value){userpassword=value;},
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                hintText: 'Password'),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(50, 20, 50, 7),
          child: Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(50, 10, 50, 5),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),

                  primary: Colors.deepPurple,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('Login'),
                onPressed: () {
                  print(useremail);
                  print(userpassword);
                  Map json = {
                    "useremail": useremail,
                    "userpassword": userpassword,
                  };
                  print (json);
                  loginUser(json).then((result) {
                    if (result['error'] != null) {
                      //failed Login
                      setState(() {
                        errormessage = result['error'];
                      });
                    }
                    else {
                      //print(result);
                      setState(() {
                        errormessage = '';
                      });
                      data.receiveAuthencation(result);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => LoadingPage()),
                      );
                    }
                  });
                }
            )),

        SizedBox(height: 10),
      ]),
    );
  }
}

