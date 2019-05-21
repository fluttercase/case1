import 'package:flutter/material.dart';
import './CardPageView.dart';

class RecordList extends StatefulWidget {
  final Color color;
  RecordList({Key key, this.color = Colors.white}) : super(key: key);

  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CardPageView(),
            SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('Transactions', style: TextStyle(color: widget.color, fontWeight: FontWeight.bold),),),
                  IconButton(icon: Icon(Icons.cached), color: widget.color, onPressed: () {},),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  Text('Today', style: TextStyle(color: Colors.grey[400]),),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell(),
                  SizedBox(height: 14,),
                  Text('Yesterday', style: TextStyle(color: Colors.grey[400]),),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell()
                ],
              ),
            )
          ],
       ),
    );
  }
  
  Widget rCell () {
    return Card(
      margin: EdgeInsets.only(top: 10),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 2, spreadRadius: 2)]
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.add_shopping_cart, color: Colors.white, size: 20,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Macbook Pro 15',style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text('Apple',style: TextStyle(color: Colors.grey, fontSize: 12),)
                  ],
                ),
                Expanded(child: Text('-2499 \$', style: TextStyle(color: Colors.red), textAlign: TextAlign.end,),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}