import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowRecentUpload extends StatefulWidget {
  // gettings the userid
  String? userId;

  ShowRecentUpload({Key? key, this.userId}) : super(key: key);

  @override
  State<ShowRecentUpload> createState() => _ShowRecentUploadState();
}

class _ShowRecentUploadState extends State<ShowRecentUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your images")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .collection('photos')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print('No data');
            print(widget.userId);
            return (const Center(child: Text("No image data")));
          } else {
            return Center(
              child: Image.asset(
                'images/humbird.gif',
                height: 125,
                width: 125,
              ),
            );
          }
        },
      ),
    );
  }
}
