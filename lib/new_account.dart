import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  String email;
  String password;
  final FirebaseAuth _auth =
      FirebaseAuth.instance; //Objek ini merepresentasikan email dan password

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'New User Account',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // **************** User Name ****************
                  Row(
                    children: <Widget>[
                      Text(
                        'Email Address: ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(width: 20.0),
                      SizedBox(
                        width: 220,
                        child: TextField(
                          onChanged: (value1) {
                            email = value1;
                          },
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                            hintText: 'Your Email',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // **************** Password ****************
                  Row(
                    children: <Widget>[
                      Text(
                        'Password: ',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(width: 20.0),
                      SizedBox(
                        width: 220.0,
                        child: TextField(
                          onChanged: (value2) {
                            password = value2;
                          },
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                          ),
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // **************** Create Button ****************
                  Center(
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            if (newUser != null) {
                              Navigator.pushNamed(context, 'Home');
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
