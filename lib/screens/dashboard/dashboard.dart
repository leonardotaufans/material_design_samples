import 'package:flutter/material.dart';
import 'package:material_design_samples/widgets/icon_list_items.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Builder(
            builder: (context) {
              return ListTile(
                title: Text('Discord'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Scaffold.of(context).showSnackBar(SnackBar(content: Text('Work In Progress!'))),
              );
            },
          )
          // ListItems(onTap: () => Navigator.pushNamed(context, '/dashboard/discord'), title: 'Discord', theme: theme)
        ],
      ),
    );
  }
}
