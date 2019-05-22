import 'package:flutter/material.dart';
import 'package:floryday/MenuItemButton.dart';
import 'package:floryday/CustomThemeData.dart';

class MenuListWidget extends StatefulWidget {
  MenuListWidget({Key key}) : super(key: key);

  MenuListWidgetState createState() => MenuListWidgetState();
}

class MenuListWidgetState extends State<MenuListWidget> {
  int selected = 1;
  String dropdownValue = 'Theme1';
  void onClick (int index) {
    setState(() {
      selected = index;
    });
  }
  @override
  void initState() {
    super.initState();
    getThemeName().then((str){
      setState(() {
        dropdownValue = str;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context);
    return StreamBuilder(
      initialData: bloc.value,
      stream: bloc.stream,
      builder: (context, snapshot) {
        ThemeObject colors = snapshot.data;
        var bcolor = getColor(bloc.themeName);
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
                  child: Text('Roger Hoffman', style: TextStyle(color: colors.primaryColor, fontWeight: FontWeight.bold),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  child: Text('San Francisco, CA', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                SizedBox(height: 20,),
                MenuItemButton(
                  title: 'Dashboard',
                  icon: Icons.card_giftcard,
                  color: selected == 1 ? bcolor:Colors.grey,
                  onMenuTap: () {
                    onClick(1);
                  },
                ),
                MenuItemButton(
                  title: 'Messages',
                  color: selected == 2 ? bcolor:Colors.grey,
                  icon: Icons.email,
                  onMenuTap: () {onClick(2);},
                ),
                MenuItemButton(
                  title: 'Utility Bills',
                  color: selected == 3 ? bcolor:Colors.grey,
                  icon: Icons.settings,
                  onMenuTap: () {onClick(3);},
                ),
                MenuItemButton(
                  title: 'Founds Transfer',
                  color: selected == 4 ? bcolor:Colors.grey,
                  icon: Icons.swap_horiz,
                  onMenuTap: () {onClick(4);},
                ),
                MenuItemButton(
                  title: 'Branches',
                  color: selected == 5 ? bcolor:Colors.grey,
                  icon: Icons.blur_linear,
                  onMenuTap: () {onClick(5);},
                ),
                MenuItemButton(
                  title: 'Change Theme',
                  color: selected == 6 ? bcolor:Colors.grey,
                  icon: Icons.color_lens,
                  onMenuTap: () {
                    onClick(6);
                    showMyMaterialDialog(context);
                  },
                ),
              ],
            ),
        );
      }
    );
  }
  Color getColor (String t) {
    switch(t) {
      case ThemeName.theme1: {
        return Colors.black;
      }
      case ThemeName.theme2: {
        return Colors.white;
      }
      default: {
        return Colors.blueAccent;
      }
    }
  }
  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text('选择主题'),
            content: DropdownButton(
              value: dropdownValue,
              onChanged: (v) {
                setState(() {
                  dropdownValue = v;
                });
                BlocProvider.of(context).changeTheme(v);
                Navigator.of(context).pop();
              },
              items: ['Theme1', 'Theme2'].map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem(value: value, child: Text(value),);
              }).toList(),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }
}