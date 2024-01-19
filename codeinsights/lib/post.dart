// /lib/post.dart

class Post {
  String title;
  String content;
  List<Comment> comments; // Add a list to store comments

  Post({
    required this.title,
    required this.content,
    List<Comment>? comments, // Initialize comments with an empty list
  }) : comments = comments ?? [];

  // Add a method to add a new comment to the post
  void addComment(Comment comment) {
    comments.add(comment);
  }
}

class Comment {
  String text;

  Comment({required this.text});
}
