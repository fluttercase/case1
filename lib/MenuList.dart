import 'package:flutter/material.dart';
import './MenuItemButton.dart';

class MenuListWidget extends StatefulWidget {
  MenuListWidget({Key key}) : super(key: key);

  _MenuListWidgetState createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  int selected = 1;
  void onClick (int index) {
    setState(() {
      selected = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 100,),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/u1.jpg'), fit: BoxFit.cover)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text('Roger Hoffman', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(top: 6),
              child: Text('San Francisco, CA', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ),
            SizedBox(height: 20,),
            MenuItemButton(
              title: 'Dashboard',
              icon: Icons.card_giftcard,
              color: selected == 1 ? Colors.white:Colors.grey,
              onMenuTap: () {
                onClick(1);
              },
            ),
            MenuItemButton(
              title: 'Messages',
              color: selected == 2 ? Colors.white:Colors.grey,
              icon: Icons.email,
              onMenuTap: () {onClick(2);},
            ),
            MenuItemButton(
              title: 'Utility Bills',
              color: selected == 3 ? Colors.white:Colors.grey,
              icon: Icons.settings,
              onMenuTap: () {onClick(3);},
            ),
            MenuItemButton(
              title: 'Founds Transfer',
              color: selected == 4 ? Colors.white:Colors.grey,
              icon: Icons.swap_horiz,
              onMenuTap: () {onClick(4);},
            ),
            MenuItemButton(
              title: 'Branches',
              color: selected == 5 ? Colors.white:Colors.grey,
              icon: Icons.blur_linear,
              onMenuTap: () {onClick(5);},
            ),
          ],
        ),
    );
  }
}