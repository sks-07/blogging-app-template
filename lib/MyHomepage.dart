import 'package:flutter/material.dart';
import 'Post.dart';
import 'mytext.dart';
import 'postlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newpost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Column(children: <Widget>[
          Expanded(child: Postlist(this.posts, widget.user)),
          Mytext(this.newpost),
        ]));
  }
}
