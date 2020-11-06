import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String email;
  String password;
  final FirebaseAuth _auth =
      FirebaseAuth.instance; //Objek ini merepresentasikan email dan password

  TextEditingController _controller =
      new TextEditingController(); //Objek ini akan menangani penghapusan password setelah logout

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
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
                      'Login',
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
                          controller: _controller,
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
                  // **************** Login Button ****************
                  Center(
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            final User = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);

                            if (User != null) {
                              Navigator.pushNamed(context, 'Service');

                              _controller
                                  .clear(); //Akan membersihkan TextField tiap kali halaman ini diakses
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
