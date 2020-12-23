import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_samples/constants.dart';

/*
* Before trying this and expecting a 100% similarity,
* The original Discord Mobile (using Kotlin) is using a
* custom layout of their own named Overlapping Panels
* https://github.com/discord/OverlappingPanels
* I still don't know how to port this to Flutter, so this
* is me trying my best to remake Discord Dashboard as quick
* and as similar as I could (currently) make.
* */
class DiscordDashboard extends StatefulWidget {
  @override
  _DiscordDashboardState createState() => _DiscordDashboardState();
}

class _DiscordDashboardState extends State<DiscordDashboard>
    with TickerProviderStateMixin {
  final String _channelName = 'general';
  final String _userName = 'Errenzii Roasted Cat';
  final String _message = 'UwU';
  final String _date = 'Today at 11:03';
  final myController = TextEditingController();
  bool textEmpty = true;
  double _fieldWidth = 200;
  double _fullWidth = 300;
  bool showSend = false;
  SnackBar uwuBar = SnackBar(
    content: Text('UwU What\'s this?'),
  );

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
    PageController pageController = PageController(
        initialPage: 1
    );

    Function dummy = () {};
    return PageView(
      controller: pageController,
      children: [
        leftPage(context, theme),
        mainPage(theme, width, context, _scaffoldState),
        rightPage(context, dummy),
      ],
    );
  }

  Theme leftPage(BuildContext context, ThemeData theme) {
    return Theme(

      data: ThemeData(
          canvasColor: Color(0xff36393f),
          backgroundColor: Color(0xff36393f),
          brightness: Brightness.dark),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff18191c),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_rounded), label: 'OwO'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_rounded), label: 'AwA'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_rounded), label: 'UwU'),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: 25),
          color: Color(0xff202225),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) =>
                          GestureDetector(
                            onTap: () =>
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('UwU'),
                                )),
                            child: CircleAvatar(
                              backgroundColor: Color(0xff2f3136),
                              radius: 25,
                              child: Icon(Icons.messenger),
                            ),
                          ),
                    ),
                    Container(
                        width: 55,
                        alignment: Alignment.center,
                        child: Divider(
                          height: 10,
                        )),
                    CircleAvatar(
                      radius: 30,
                      child: Text('O'),
                      backgroundColor: Color(0xff2f3136),
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Text('W'),
                      backgroundColor: Color(0xff2f3136),
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Text('O'),
                      backgroundColor: Color(0xff2f3136),
                    ),
                  ],
                ),
              ), //Server List
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff2f3136),
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Stack(alignment: Alignment.centerLeft, children: [
                        Text(
                          'Server Name',
                          style: theme.textTheme.headline5
                              .copyWith(color: Colors.white),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                onPressed: () {}))
                      ]), //Title
                      SizedBox(
                          width: 200,
                          child: RaisedButton(
                            color: Color(0xff4f545c),
                            onPressed: () {},
                            child: Text(
                              'Invite Members',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 36,
                              decoration: BoxDecoration(
                                  color: Color(0xff42464d),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Text('# ',
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 20)),
                                  Text('general',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 36,
                              child: Row(
                                children: [
                                  Text('# ',
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: 20)),
                                  Text('other-channel',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 36,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.audiotrack,
                                    color: Colors.white38,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('audio-channel',
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16)),
                                ],
                              ),
                            ),
                            // Channel
                          ],
                        ), //Channels
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Theme rightPage(BuildContext context, Function dummy) {
    return Theme(
      data: ThemeData(
          canvasColor: Color(0xff36393f),
          backgroundColor: Color(0xff36393f),
          brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.white,
          elevation: 1,
          backgroundColor: Color(0xff2f3136),
          toolbarHeight: 60,
          title: Row(children: [
            Text(
              '#',
              style: TextStyle(fontSize: 28, color: Colors.white38),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
            Text('general')
          ]),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xff2f3136),
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopMenuButton(
                        context: context,
                        onTap: () {},
                        dummyIcon: Icon(Icons.search),
                        dummyLabel: 'Search'),
                    TopMenuButton(
                        context: context,
                        onTap: () {},
                        dummyIcon: Icon(Icons.push_pin_rounded),
                        dummyLabel: 'Pin'),
                    TopMenuButton(
                        context: context,
                        onTap: dummy,
                        dummyIcon: Icon(Icons.notifications),
                        dummyLabel: 'Notifications'),
                    TopMenuButton(
                        context: context,
                        onTap: dummy,
                        dummyIcon: Icon(Icons.settings),
                        dummyLabel: 'Settings'),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('ONLINE — 4'),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 4,
                  itemBuilder: (context, index) =>
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Stack(children: [
                              CircleAvatar(
                                radius: 18,
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                ),
                              )
                            ]),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Errenzii the Roasted Cat\n'),
                                  TextSpan(
                                      text: 'Listening to your conversation',
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 12))
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                ),
              ),
            ]),
      ),
    );
  }

  Theme mainPage(ThemeData theme, double width, BuildContext context,
      GlobalKey<ScaffoldState> _scaffoldState) {
    return Theme(
      data: ThemeData(
          canvasColor: Color(0xff36393f),
          backgroundColor: Color(0xff36393f),
          brightness: Brightness.dark),
      child: Scaffold(
        appBar: AppBar(
          leading: FlatButton(child: Icon(Icons.menu), onPressed: () {}),
          automaticallyImplyLeading: false,
          title: Text('# general'),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                DiscordChatItems(
                    userName: _userName,
                    theme: theme,
                    message: _message,
                    date: _date),
                DiscordChatItems(
                    userName: _userName,
                    theme: theme,
                    message: _message,
                    date: _date),
                DiscordChatItems(
                    userName: _userName,
                    theme: theme,
                    message: _message,
                    date: _date),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xff292b2f),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          shape: CircleBorder(),
                          child: Icon(Icons.camera_alt,
                              color: Colors.white70, size: 26),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xff292b2f),
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          shape: CircleBorder(),
                          child: Icon(Icons.image, color: Colors.white70,
                              size: 26),
                        ),
                      ),
                      SizedBox(
                        width: width - 100,
                        height: 40,
                        child: ClipRect(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Color(0xff292b2f)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedSize(
                                  curve: Curves.bounceInOut,
                                  vsync: this,
                                  duration: new Duration(milliseconds: 50),
                                  child: Container(
                                    width: _fieldWidth,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: TextField(
                                      controller: myController,
                                      onChanged:
                                      textField(context, myController, width),
                                      style: theme.textTheme.bodyText2
                                          .copyWith(color: Colors.white),
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Message #$_channelName",
                                          hintStyle: theme.textTheme.bodyText2
                                              .copyWith(color: Colors.white38)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                  child: RaisedButton(
                                    onPressed: () =>
                                        _scaffoldState.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text('UwU What\'s this'),
                                          action: SnackBarAction(
                                              label: 'Dismiss',
                                              onPressed: () =>
                                              (_scaffoldState
                                                  .currentState
                                                  .hideCurrentSnackBar())),
                                        )),
                                    color: Color(0xff292b2f),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    shape: CircleBorder(),
                                    child: Icon(Icons.emoji_emotions_sharp,
                                        color: Colors.white70, size: 26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !textEmpty,
                        child: SizedBox(
                          width: 50,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Color(0xff7289da),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 15),
                            shape: CircleBorder(),
                            child: Icon(Icons.send_rounded,
                                color: Colors.white, size: 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // myController.addListener()
  }

  textField(BuildContext context, TextEditingController myController,
      double width) {
    setState(() {
      if (myController.text.length > 0) {
        textEmpty = false;
        _fieldWidth = 160;
        _fullWidth = 230;
      } else {
        textEmpty = true;
        _fieldWidth = 200;
        _fullWidth = 300;
      }
    });
  }
}

class TopMenuButton extends StatelessWidget {
  const TopMenuButton({
    Key key,
    @required this.onTap,
    @required this.dummyIcon,
    @required this.dummyLabel,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;
  final Function onTap;
  final Icon dummyIcon;
  final String dummyLabel;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>
          InkWell(
            onTap: onTap,
            child: Container(
              width: 75,
              height: 60,
              alignment: Alignment.center,
              child: Column(
                children: [
                  dummyIcon,
                  SizedBox(
                    height: 5,
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      dummyLabel,
                      style: TextStyle(fontSize: 12),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}

class DiscordChatItems extends StatelessWidget {
  const DiscordChatItems({
    Key key,
    @required String userName,
    @required this.theme,
    @required String message,
    @required String date,
  })
      : _userName = userName,
        _message = message,
        _date = date,
        super(key: key);

  final String _userName;
  final ThemeData theme;
  final String _message;
  final String _date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 60,
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            CircleAvatar(
              radius: 20,
              child: Text(_userName.substring(0, 1)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style:
                  theme.textTheme.bodyText1.copyWith(color: Colors.white),
                ),
                Text(
                  _message,
                  style:
                  theme.textTheme.bodyText2.copyWith(color: Colors.white),
                )
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
                height: 40,
                child: Text(
                  _date,
                  style:
                  theme.textTheme.caption.copyWith(color: Colors.white38),
                ))
          ],
        ),
      ),
    );
  }
}
