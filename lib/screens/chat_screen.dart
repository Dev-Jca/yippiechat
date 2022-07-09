import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats/eoM4oZjVWapMhCfrmgnC/messages')
            .snapshots(),
        builder: (context, snapshot) {
          final docsData = snapshot.data?.docs;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: docsData?.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8),
              child: Text(docsData?[index]['text']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/eoM4oZjVWapMhCfrmgnC/messages')
              .add({'text': 'This was added by clicking the button'});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
