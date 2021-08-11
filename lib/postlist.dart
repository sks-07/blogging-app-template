import 'package:flutter/material.dart';
import 'Post.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Postlist extends StatefulWidget {
  final List<Post> listitems;
  final FirebaseUser user;
  Postlist(this.listitems, this.user);

  @override
  _PostlistState createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  void like(Function callback) {
    this.setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listitems.length,
      itemBuilder: (context, index) {
        var post = this.widget.listitems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text(post.body),
                subtitle: Text(post.author),
              )),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(post.usersLiked.length.toString(),
                        style: TextStyle(fontSize: 20)),
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                  IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () =>
                          this.like(() => post.likepost(widget.user)),
                      color: post.usersLiked.contains(widget.user.uid)
                          ? Colors.green
                          : Colors.black)
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
