import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ButtonBorder(
              title: 'Flat Button',
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Flat Button',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: theme.accentColor,
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios),
                  label: Text('Flat Button Icon'),
                ),
              ],
            ),
            Pad(),
            ButtonBorder(
              title: 'Text Button',
              children: [
                TextButton(onPressed: () {}, child: Text('Text Button Icon')),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.warning_amber_rounded),
                    label: Text('Text Button Icon')),
              ],
            ),
            Pad(),
            ButtonBorder(title: 'Button Bar', children: [
              ButtonBar(
                children: [
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.close),
                      label: Text('Cancel')),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.check),
                      label: Text('Not Cancel'))
                ],
              )
            ]),
            Pad(),
            ButtonBorder(title: 'Dropdown Button', children: [DropButton()]),
            Pad(),
            ButtonBorder(title: 'Floating Action Button', children: [
              FloatingActionButton(
                heroTag: 'btn1',
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              Pad(),
              FloatingActionButton.extended(
                heroTag: 'btn2',
                onPressed: () {},
                label: Text('Add'),
                icon: Icon(Icons.add),
              ),
            ]),
            ButtonBorder(title: 'Icon Button',children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.add), onPressed: () {}),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: null,
                  ),
                  IconButton(
                      icon: Icon(Icons.push_pin_rounded), onPressed: () {}),
                  IconButton(icon: Icon(Icons.check), onPressed: null),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class Pad extends StatelessWidget {
  const Pad({
    Key key,
    this.height = 10,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class DropButton extends StatefulWidget {
  const DropButton({
    Key key,
  }) : super(key: key);

  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  var dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: dropdownValue,
        items: <String>['One', 'Two', 'Three', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        });
  }
}

class ButtonBorder extends StatelessWidget {
  const ButtonBorder(
      {Key key, @required this.title, @required this.children, this.hint})
      : super(key: key);

  final String title;
  final List<Widget> children;
  final Function hint;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Visibility(
          visible: hint != null,
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(icon: Icon(Icons.info), onPressed: hint))),
      Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border:
              Border.all(color: Colors.blueGrey.withOpacity(0.25), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .overline
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            Pad(),
            Container(width: double.infinity, child: Column(children: children))
          ],
        ),
      ),
    ]);
  }
}
