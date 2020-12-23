import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:zefyr/zefyr.dart';
import 'package:quill_delta/quill_delta.dart';


// Usage tutorial: https://zefyr-editor.gitbook.io/docs/quick-start
class MarkdownScreen extends StatefulWidget {
  @override
  _MarkdownScreenState createState() => _MarkdownScreenState();
}

class _MarkdownScreenState extends State<MarkdownScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;
  TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () => _saveDocument(context, _controller2.text),
                  ),
            )
          ],
          bottom: PreferredSize(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 16),
              child: TextFormField(
                controller: _controller2,
                decoration: InputDecoration.collapsed(hintText: 'Title:'),
                maxLength: 40,
                maxLengthEnforced: true,
                maxLines: 1,
              ),
            ),
            preferredSize: Size.fromHeight(40),
          ),
        ),
        body: ZefyrScaffold(
          child: ZefyrTheme(
            data: ZefyrThemeData(),
            child: ZefyrEditor(
              padding: EdgeInsets.all(16),
              controller: _controller,
              focusNode: _focusNode,
            ),
          ),
        ));
  }

  void _saveDocument(BuildContext context, String title) {
    final contents = jsonEncode(_controller.document);
    final name = title != '' ? title.replaceAll(' ', '_') : getRandom().toString();
    final file = File(Directory.systemTemp.path + "/$name.json");
    file
        .writeAsString(contents)
        .then((_) =>
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('$name saved!'),
        )));
  }

  int getRandom() {
    var max = 999999;
    var min = 100000;
    var rand = new Random();
    return min + rand.nextInt(max - min);
  }

  @override
  void initState() {
    super.initState();
    _controller2.addListener(() {});
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()
      ..insert("\n");
    return NotusDocument.fromDelta(delta);
  }
}
