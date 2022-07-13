import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yippiechat/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        final docsData = snapshot.data?.docs;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          reverse: true,
          itemCount: docsData?.length,
          itemBuilder: (context, index) => MessageBubble(
            key: ValueKey(docsData?[index].id),
            message: docsData?[index]['text'],
            isMe: docsData?[index]['userId'] ==
                FirebaseAuth.instance.currentUser!.uid,
            userName: docsData?[index]['username'],
            userImageUrl: docsData?[index]['userImage'],
          ),
        );
      },
    );
  }
}
