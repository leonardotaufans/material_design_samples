import 'package:flutter/material.dart';
import 'package:material_design_samples/constants.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key key,
    @required this.onTap,
    this.icon,
    @required this.title,
    @required this.theme,
  }) : super(key: key);

  final Function onTap;
  final IconData icon;
  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: jDefaultPadding / 2),
        height: 80,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: [
            Icon(
              icon,
              color: theme.accentColor,
            ),
            Text(title,
                style: theme.textTheme.subtitle1
                    .copyWith(fontWeight: FontWeight.bold)),
            Icon(
              Icons.chevron_right,
              color: theme.accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
