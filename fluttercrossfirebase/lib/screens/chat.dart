import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercrossfirebase/screens/welcom.dart';

final _auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _firestrore = FirebaseFirestore.instance;

  late User currentUser;
  String message = '';

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final User user = _auth.currentUser!;
      final uid = user.uid;
      if (user.email != null) {
        currentUser = user;
      }
    } catch (e) {}
  }

  pushToWelcom() {
    Navigator.pushNamed(context, Welcom.id);
  }

  void messagesStream() async {
    await for (var snapshot in _firestrore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                messagesStream();
                // _auth.signOut();
                // pushToWelcom();
              }),
        ],
        title: const Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      _firestrore
                          .collection('messages')
                          .add({'sender': currentUser.email, 'text': message});
                      messageTextController.clear();
                    },
                    child: const Text(
                      'Send',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatefulWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  final _firestrore = FirebaseFirestore.instance;

  late User currentUser;
  String message = '';

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final User user = _auth.currentUser!;
      if (user.email != null) {
        currentUser = user;
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data?.docs.reversed;
          List<MessageBubble> messagesWidgets = [];
          for (var message in messages!) {
            final user = currentUser.email;

            final messageWidget = MessageBubble(
              sender: message['sender'],
              text: message['text'],
              isMe: (user == message['sender']),
            );
            messagesWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              children: messagesWidgets,
            ),
          );
        }
        return const Text('no message');
      },
      stream: _firestrore.collection('messages').snapshots(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key, this.sender = '', this.text = '', this.isMe = true})
      : super(key: key);

  final bool isMe;
  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender,
              style: const TextStyle(color: Colors.black38, fontSize: 12)),
          Material(
            elevation: 10,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            color: isMe ? Colors.deepOrangeAccent : Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
