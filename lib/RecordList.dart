import 'package:flutter/material.dart';
import './CardPageView.dart';
import './DetailRecordPage.dart';
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
                  Text('Today', style: TextStyle(color: Colors.grey),),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell(),
                  rCell(),
                  SizedBox(height: 14,),
                  Text('Yesterday', style: TextStyle(color: Colors.grey),),
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Color.fromRGBO(200, 200, 200, 0.4), blurRadius: 10, spreadRadius: 2)],
              color: Colors.white
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.add_shopping_cart, color: Colors.black, size: 20,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Macbook Pro 15',style: TextStyle(color: Colors.black, fontSize: 14),),
                    SizedBox(height: 5,),
                    Text('Apple',style: TextStyle(color: Colors.grey[600], fontSize: 12),)
                  ],
                ),
                Expanded(child: Text('-2499 \$', style: TextStyle(color: Colors.red), textAlign: TextAlign.end,),)
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => DetailRecordPage()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}