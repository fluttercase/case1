import 'package:flutter/material.dart';

class BlankCard extends StatelessWidget {
  final double width;
  const BlankCard({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: width,
        margin: const EdgeInsets.all(6.0),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Current Balance', style: TextStyle(color: Colors.grey[100], fontSize: 12),),
                    SizedBox(height: 3,),
                    Text('\$12,432.32', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                  ],
                ),
                Text('BlankX', style: TextStyle(color: Colors.white),)
              ],
            ),
            Row(
              children: <Widget>[
                Text('****   ****   ***** 1505', style: TextStyle(color: Colors.white, fontSize: 16),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Card Holder', style: TextStyle(color: Colors.grey[100], fontSize: 12),),
                    SizedBox(height: 4,),
                    Text('Laurel Bailey', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Expires', style: TextStyle(color: Colors.grey[100], fontSize: 12),),
                    SizedBox(height: 4,),
                    Text('05/20', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
          boxShadow: [BoxShadow(color: Color(0x11448AFF), blurRadius: 6, spreadRadius: 5)]
        ),
      ),
    );
  }
}