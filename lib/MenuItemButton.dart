import 'package:flutter/material.dart';

typedef void OnMenuTap();

class MenuItemButton extends StatelessWidget {
  final OnMenuTap onMenuTap;
  final String title;
  final IconData icon;
  final Color color;
  const MenuItemButton({Key key, this.onMenuTap, this.title, this.icon, this.color}) : super(key: key);

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
              Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        onTap: onMenuTap
      ),
    );
  }
}