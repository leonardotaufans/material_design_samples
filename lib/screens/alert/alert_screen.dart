import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:material_design_samples/widgets/list_items.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

enum Choices { Choice1, Choice2, Choice3, Choice4, Choice5 }

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Choices chosen = Choices.Choice1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
      ),
      body: ListView(
        children: [
          ListItems(
              onTap: () => showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierLabel: 'Full Screen Dialog',
                  transitionDuration: Duration(milliseconds: 300),
                  pageBuilder: (_, __, ___) {
                    return SizedBox.expand(
                      child: Scaffold(
                        backgroundColor: Colors.white.withOpacity(0.6),
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('This is an Alert Dialog!'),
                              SizedBox(
                                height: 40,
                              ),
                              FloatingActionButton(
                                  child: Icon(Icons.close),
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog'))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              title: 'Full Screen Dialog',
              theme: theme),
          ListItems(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: true,
                  // false = user must tap button, true = tap outside dialog
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      title: Text('Basic Dialog'),
                      content: Text('Content for the dialog'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Dismiss'),
                          onPressed: () {
                            Navigator.of(dialogContext)
                                .pop(); // Dismiss alert dialog
                          },
                        ),
                        FlatButton(onPressed: null, child: Text('Disabled'))
                      ],
                    );
                  },
                );
              },
              title: 'Basic Dialog',
              theme: theme),
          ListItems(
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2021));
              },
              title: 'Date Picker Dialog',
              theme: theme),
          ListItems(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        elevation: 5,
                        contentPadding: EdgeInsets.all(10),
                          content: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 400, minHeight: 40),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Row(
                              children: [
                                Text('Accounts'),
                                Spacer(),
                                IconButton(icon: Icon(Icons.add), onPressed: () {})
                              ],
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                CircleAvatar(child: Text('E'),),
                                SizedBox(width: 5,),
                                Flexible(child: Text('leonardotaufans@gmail.com', softWrap: true, maxLines: 1, style: TextStyle(color: Colors.black87),)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                CircleAvatar(child: Text('R'),),
                                SizedBox(width: 5,),
                                Flexible(child: Text('raavikun@gmail.com', softWrap: true, maxLines: 1, style: TextStyle(color: Colors.black87))),
                              ],
                            ),
                          ],
                        ),
                      ));
                    });
              },
              title: 'Account Chooser',
              theme: theme)
        ],
      ),
    );
  }
}
