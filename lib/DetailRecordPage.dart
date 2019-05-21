import 'package:flutter/material.dart';

class DetailRecordPage extends StatefulWidget {
  DetailRecordPage({Key key}) : super(key: key);

  _DetailRecordPageState createState() => _DetailRecordPageState();
}

class _DetailRecordPageState extends State<DetailRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}