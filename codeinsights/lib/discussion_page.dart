// /lib/discussion_page.dart

import 'package:flutter/material.dart';

import 'comment_screen.dart'; // Import the CommentScreen
import 'create_post_screen.dart'; // Import the CreatePostScreen
import 'post.dart';

class DiscussionPage extends StatefulWidget {
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussion Page'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return buildPostItem(posts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );

          if (result != null && result is Post) {
            setState(() {
              posts.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildPostItem(Post post) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.content),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CommentScreen(post: post)),
        );
        setState(() {}); // Refresh the UI after returning from CommentScreen
      },
    );
  }
}


//code by seirennn
