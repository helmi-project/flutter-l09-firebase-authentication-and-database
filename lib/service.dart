import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Objek database merepresentasikan sekumpulan database yang akan dikirim ke Firebase
  //My_Service merepresentasikan nama database yang akan berisikan value database dengan format JSON
  final DatabaseReference database =
      FirebaseDatabase.instance.reference().child("My_Service");

  //Buat fungsi yang akan mengirim value database app ke Firebase menggunakan method push() dan set()
  sendData() {
    database.push().set(
      {'Name': 'William', 'Country': 'USA', 'City': 'Denver'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Android ATC Services'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  child: Text(
                    'Welcome to Android ATC',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Save"),
                onPressed: () => sendData(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
