import 'package:cinema/widgets/drawer/navigation_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationExpandedListTile extends StatelessWidget {
  final String title;
  final Function onPressed;
  final List<String> children;

  const NavigationExpandedListTile({
    Key key,
    @required this.title,
    @required this.onPressed,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withOpacity(0.5),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        children: [
          for (int i = 0; i < children.length; i++)
            NavigationSubListItem(
              title: children[i],
              onPressed: () => onPressed(i),
            ),
        ],
      ),
    );
  }
}
