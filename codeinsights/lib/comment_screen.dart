// /lib/comment_screen.dart

import 'package:flutter/material.dart';

import 'auth.dart'; // Import your AuthService
import 'auth_dialog.dart'; // Import the AuthDialog
import 'post.dart';

class CommentScreen extends StatefulWidget {
  final Post post;

  CommentScreen({required this.post});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _commentController = TextEditingController();
  final AuthService _auth = AuthService(); // Create an instance of AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Post Title: ${widget.post.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Post Content: ${widget.post.content}'),
            SizedBox(height: 16),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.post.comments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(widget.post.comments[index].text),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Add a comment...'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_auth.currentUser != null) {
                  // User is logged in, allow commenting
                  if (_commentController.text.isNotEmpty) {
                    Comment newComment = Comment(text: _commentController.text);
                    setState(() {
                      widget.post.addComment(newComment);
                      _commentController.clear();
                    });
                  }
                } else {
                  // User is not logged in, show authentication dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AuthDialog();
                    },
                  );
                }
              },
              child: Text('Add Comment'),
            ),
          ],
        ),
      ),
    );
  }
}
