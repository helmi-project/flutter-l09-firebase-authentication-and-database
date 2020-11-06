import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyCloud extends StatefulWidget {
  @override
  _MyCloudState createState() => _MyCloudState();
}

class _MyCloudState extends State<MyCloud> {
  //Dengan snapshot data yang diperbarui akan dapat langsung diupdate secara real time
  List<Widget> dataListWidget(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((document) {
      return ListTile(
        title: Text(document["Name"]),
        subtitle: Text(document["City"]),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Cloud Firestore'),
        ),
        body: Container(
          child: StreamBuilder(
            //StreamBuilder adalah widget yang dapat menangkap event data (listener dengan stream) dan membangun kembali data (update dengan builder)
            stream: Firestore.instance.collection('customers').snapshots(),
            builder: (context, snapshot) {
              return ListView(
                children: dataListWidget(snapshot),
              );
            },
          ),
        ),
      ),
    );
  }
}
