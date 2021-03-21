import 'package:flutter/material.dart';
import 'package:flutter_tmdb/post/model/PostModel.dart';

class PostItemRow extends StatelessWidget {
  final PostModel post;
  const PostItemRow({this.post});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${post.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}
