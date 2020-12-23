import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_samples/constants.dart';
import 'package:material_design_samples/widgets/icon_list_items.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Text title;
    Icon leading;
    Function onTap;
    SnackBar wipSnackBar = SnackBar(
      content: Text('Work In Progress!'),
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Material Design Sample',
          style: TextStyle(color: theme.accentColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: jDefaultPadding / 2),
        children: [
          MyListTile(
              onTap: () => Navigator.pushNamed(context, '/alert-dialog'),
              leading: Icons.notification_important,
              title: Text('Alert Dialog')),
          Builder(
              builder: (context) => MyListTile(
                  leading: Icons.lock_open_rounded,
                  title: Text('Authentication'),
                  //todo: 
                  onTap: () => Scaffold.of(context).showSnackBar(wipSnackBar))),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.auto_awesome_motion,
              title: 'Backdrop',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.border_bottom_rounded,
              title: 'Bottom Navigation',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.border_color,
              title: 'Bottom Sheets',
              theme: theme),
          ListItems(
              onTap: () => Navigator.pushNamed(context, '/button'),
              icon: Icons.smart_button,
              title: 'Buttons',
              theme: theme),
          ListItems(
              onTap: () => Navigator.pushNamed(context, '/dashboard'),
              icon: Icons.dashboard,
              title: 'Dashboard',
              theme: theme),
          ListItems(
            onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Work In Progress!'),
            )),
            icon: Icons.border_clear_rounded,
            title: 'Dialogs',
            theme: theme,
          ),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.do_not_disturb_on,
              title: 'Empty States',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.login,
              title: 'Entry Screens',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.add_circle_outline_rounded,
              title: 'Floating Action Button',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.list,
              title: 'Lists',
              theme: theme),
          ListItems(
            onTap: () => Navigator.pushNamed(context, '/markdown'),
            icon: Icons.format_align_left,
            title: 'Markdown',
            theme: theme,
          ),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.menu,
              title: 'Navigation Drawers',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.notifications,
              title: 'Notification Builders',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.person,
              title: 'Profile',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.border_right,
              title: 'Side Sheet',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.tab_unselected_rounded,
              title: 'Tabs',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.credit_card,
              title: 'Toolbar',
              theme: theme),
          ListItems(
              onTap: () => _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Work In Progress!'),
                  )),
              icon: Icons.amp_stories_rounded,
              title: 'View Pager',
              theme: theme)
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key key,
    @required this.onTap,
    @required this.leading,
    @required this.title,
  }) : super(key: key);

  final Function onTap;
  final IconData leading;
  final Text title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      onTap: onTap,
      leading: Icon(leading),
      title: Align(alignment: Alignment.center, child: title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
