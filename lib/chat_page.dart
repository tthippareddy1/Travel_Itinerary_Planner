import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  final String tripId;

  const ChatPage({super.key, required this.tripId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 🔐 Auth check
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, 'login');
      });
    }
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    FirebaseFirestore.instance
        .collection('trips')
        .doc(widget.tripId)
        .collection('chat')
        .add({
      'text': _controller.text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
      'sender': FirebaseAuth.instance.currentUser?.email ?? 'Unknown',
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Group Chat")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('trips')
                  .doc(widget.tripId)
                  .collection('chat')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index]['text'];
                    final sender = messages[index]['sender'];
                    return ListTile(
                      title: Text(message),
                      subtitle: Text(sender),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Type a message"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChatPage extends StatelessWidget {
//   final String hikeName;
//   final String hikeId;

//   ChatPage({super.key, required this.hikeName, required this.hikeId});

//   final TextEditingController _messageController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _sendMessage() async {
//     if (_messageController.text.isNotEmpty) {
//       String? username =
//           _auth.currentUser?.email; // Replace with display name if available
//       await _firestore
//           .collection('trip-chats')
//           .doc(hikeId)
//           .collection('messages')
//           .add({
//         'username': username ?? 'Unknown',
//         'message': _messageController.text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(hikeName),
//         backgroundColor: Colors.blueGrey,
//       ),
//       body: Column(
//         children: [
//           Container(
            
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image:
//                     AssetImage("assets/background.jpg"), // Path to your image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore
//                   .collection('trip-chats')
//                   .doc(hikeId)
//                   .collection('messages')
//                   .orderBy('timestamp', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(child: CircularProgressIndicator());
//                 }

//                 final messages = snapshot.data!.docs;

//                 return ListView.builder(
//                   reverse: true, // To display the latest messages at the bottom
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     var message = messages[index];
//                     return ListTile(
//                       title: Text(message['username']),
//                       subtitle: Text(message['message']),
//                       trailing: Text(
//                         message['timestamp'] != null
//                             ? (message['timestamp'] as Timestamp)
//                                 .toDate()
//                                 .toLocal()
//                                 .toString()
//                             : 'Just now',
//                         style:
//                             const TextStyle(fontSize: 12, color: Colors.grey),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),

//           // Input Field
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: const InputDecoration(
//                       hintText: 'Type your message...',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: _sendMessage,
//                   child: const Text('Send'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
