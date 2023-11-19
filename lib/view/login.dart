// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_incl/view/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String userInput;
  late String passInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24.0),
          child: SingleChildScrollView(

    child:Center(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
              Text('Welcome to News Incl',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900
              ),
              ),
                SizedBox(height: 30.0,),
                Container(
                  height: 200.0,
                  child: Image.asset('lib/assets/doorLogin.png',
                  height: 400,),
                ),
                SizedBox(height: 30.0,),
                Text('Login to continue exploring world beyond door',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.center,),
                SizedBox(height: 30.0,),
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Email/Phone No.'
                  ),
                  onChanged: (value) {
                    userInput = value;
                    //Do something with the user input.
                  },

                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(height: 10.0,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Password'
                  ),
                  onChanged: (value) {
                    passInput = value;
                    //Do something with the user input.
                  },

                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        if((userInput=='user' || userInput == '8007319488') && passInput == 'pass') {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                          //Implement login functionality.
                        }else{
                          final snackBar = SnackBar(
                            content: Text('Incorrect Email/Phone No. or Password'),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
              ],
            ),
    ),
        )

    ),
    );
  }
}
