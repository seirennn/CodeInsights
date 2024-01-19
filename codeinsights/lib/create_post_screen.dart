// /lib/create_post_screen.dart

import 'package:flutter/material.dart';

import 'post.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _contentController.text.isNotEmpty) {
                  Post newPost = Post(
                    title: _titleController.text,
                    content: _contentController.text,
                  );
                  Navigator.pop(context, newPost);
                }
              },
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
