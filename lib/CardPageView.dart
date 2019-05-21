import 'dart:math';

import 'package:flutter/material.dart';

class CardPageView extends StatefulWidget {
  CardPageView({Key key}) : super(key: key);

  _CardPageViewState createState() => _CardPageViewState();
}

class _CardPageViewState extends State<CardPageView> {
  PageController _pagecontroller = new PageController(initialPage: 0, viewportFraction: 0.8,);
  int selectIndex = 0;
  double scrollValue = 0;
  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
        scrollValue = _pagecontroller.page;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 180,
      child: Stack(
          children: <Widget>[
            Container(
              height: 160,
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pagecontroller,
                onPageChanged: (index){
                  print(index);
                  setState(() {
                    selectIndex = index;
                  });
                },
                itemCount: 5,
                itemBuilder: (c, index) {
                  return _builder(index);  
                },
              ),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _dot(0),
                  _dot(1),
                  _dot(2),
                  _dot(3),
                  _dot(4),
                ],
              ),
            )
          ]
        ),
    );
  }

  Widget _dot (index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: index == selectIndex ? Colors.blueAccent : Colors.grey,
      ),
    );
  }
  Widget _builder(int index) {
    return AnimatedBuilder(
      animation: _pagecontroller,
      builder: (context, child) {
        double value = 1.0;
        // if (_pagecontroller.position.haveDimensions) {
          value = scrollValue - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        // }
        print('->>> $value , ${160}');
        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 160,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }
}