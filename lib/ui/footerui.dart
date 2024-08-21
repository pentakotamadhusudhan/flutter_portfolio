import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 1,

      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          ListTile(title: Text("madhu"),),
          ListTile(title: Text("madhu"),),
          ListTile(title: Text("madhu"),),
          ListTile(title: Text("madhu"),),
          ListTile(title: Text("madhu"),),
          ListTile(title: Text("madhu"),),
        ],
      ),
    );
  }
}
