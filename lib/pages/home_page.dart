import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';
import 'package:chrip/auth/show_images.dart';
import 'package:chrip/auth/storage_page.dart';
import 'package:chrip/read%20data/get_user_name.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  // document IDs
  List<String> docIds = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIds.add(document.reference.id);
            },
          ),
        );
  }

  Future getImgId() async {
    await FireStoreDataBase()
        .GetData()
        .then((snapshot) => snapshot.docs.forEach());
    builder:
    (context, snapshot) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return Image.network(
          snapshot.data.toString(),
          fit: BoxFit.cover,
        );
      }
      return const Center(child: CircularProgressIndicator());
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            user.email!,
            style: TextStyle(fontSize: 16),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(documentId: docIds[index]),
                          tileColor: Colors.grey[200],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowUploads(userId: user.uid),
                      ),
                    );
                  },
                  child: const Text("Show Images"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
