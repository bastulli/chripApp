import 'dart:html';
import 'package:chrip/widgets/navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryList extends StatefulWidget {
  // gettings the userid
  String? userId;

  HistoryList({Key? key, this.userId}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(userId: widget.userId),
      appBar: AppBar(title: Center(child: const Text("H I S T O R Y"))),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.userId)
            .collection('photos')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            print('No data');
            print(widget.userId);
            return (const Center(child: Text("No image data")));
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                String url = snapshot.data!.docs[index]['downloadURL'];
                String species =
                    snapshot.data!.docs[index]['species']['predictions'][0];
                Timestamp timestamp = snapshot.data!.docs[index]['date'];
                String time =
                    DateTime.parse(timestamp.toDate().toString()).toString();
                String cameraName = 'Backyard';
                return ListTile(
                  leading: Image.network(
                    url,
                    width: 100,
                    fit: BoxFit.fitWidth,
                  ),
                  title: Text(
                    species,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  subtitle: Text(time,
                      style: TextStyle(color: Colors.blue[500], fontSize: 15)),
                  trailing: Text(
                    cameraName,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey[200],
                  thickness: 5,
                  height: 30,
                );
              },
            );
          }
        },
      ),
    );
  }
}
