import 'package:flutter/material.dart';

typedef void OnMenuTap();

class MenuItemButton extends StatelessWidget {
  final OnMenuTap onMenuTap;
  final String title;
  final IconData icon;
  final Color color;
  final bool newMesg;
  const MenuItemButton({Key key, this.onMenuTap, this.title, this.icon, this.color, this.newMesg = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: <Widget>[
              Icon(icon, color: color, size: 22),
              SizedBox(width: 6,),
              Stack(
                children: <Widget>[ 
                  Row(children: <Widget>[
                    Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold),),
                    SizedBox(width: 8,)
                  ],),
                  Visibility(
                    visible: newMesg,
                    child: Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.red
                        ),
                      ),
                    ),
                  )
                ]
              )
            ],
          ),
        ),
        onTap: onMenuTap
      ),
    );
  }
}