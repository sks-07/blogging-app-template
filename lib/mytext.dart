import 'package:flutter/material.dart';

class Mytext extends StatefulWidget {
  final Function(String) callback;

  Mytext(this.callback);

  @override
  _MytextState createState() => _MytextState();
}

class _MytextState extends State<Mytext> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.message),
        labelText: 'type ypur message',
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          splashColor: Colors.blue,
          tooltip: "Post message",
          onPressed: this.click,
        ),
      ),
    );
  }
}
