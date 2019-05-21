import 'package:flutter/material.dart';


class AddBlankCard extends StatefulWidget {
  AddBlankCard({Key key}) : super(key: key);

  _AddBlankCardState createState() => _AddBlankCardState();
}

class _AddBlankCardState extends State<AddBlankCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add blank card'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}