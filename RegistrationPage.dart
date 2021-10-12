import 'package:flutter/material.dart';
import '../Controller/authentication.dart';
import 'LoginPage.dart';
import '../Model/Authentication.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String errormessage ='';
  String username;
  String useremail;
  String userpassword;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.fromLTRB(50, 10, 50, 8),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  hintText: 'User Name'),
              onChanged: (value){username=value;},
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
            child: TextField(

              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  hintText: 'Email'),
              onChanged: (value){useremail=value;},
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
              '',
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
                  onPressed: () {
                      Map json = {
                      "username": username,
                      "useremail": useremail,
                      "userpassword": userpassword,
                              };
                      print(json);
                      registerUser(json).then((result) {
                      if (result['error'] != null) {
                      //error
                    setState(() {
                    errormessage = result['error'];
                        });
                         } else {
                        //success
                        setState(() {
                          errormessage = '';
                        });
                      }
                  print(result);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                   });
                  },

                child: Text('Register'),

              )),

          Expanded(
            child: Container(),

          ),
        ])
    );
  }
}

