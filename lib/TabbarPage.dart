import 'package:flutter/material.dart';
import 'package:floryday/Home.dart';


class TabbarPage extends StatefulWidget {
  TabbarPage({Key key}) : super(key: key);

  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> with SingleTickerProviderStateMixin {
  PageController _pctrl;
  @override
  void initState() {
    super.initState();
    _pctrl = PageController(initialPage: 0);
    _pctrl.addListener((){
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView(
            controller: _pctrl,
            children: <Widget>[
              HomeWidget(),
              HomeWidget(),
              HomeWidget(),
              HomeWidget()
            ],
          ),
        ),
        Container(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.home),
              Icon(Icons.home),
              Icon(Icons.home),
              Icon(Icons.home),
            ],
          ),
        )
      ],
    );
  }
}