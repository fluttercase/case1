import 'package:flutter/material.dart';
import './RecordList.dart';
import './Carousel.dart';

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key}) : super(key: key);

  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin{
  AnimationController  controller;
  AnimationController  controller1;
  bool openStatus = false;
  Animation<double> animation;
  Animation<double> translateXAnimation;
  Animation<double> topTween;
  int aniTime = 300;
  Animation _colorTween;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: Duration(milliseconds: aniTime), vsync: this);

    topTween = new Tween(begin:  0.0, end: 10.0).animate(controller)..addListener((){
      setState(() {});
    });

    Animation curve = new CurvedAnimation(parent: controller, curve: Curves.linear);
    translateXAnimation = new Tween(begin: 0.0, end: 200.0).animate(controller)..addListener(() {
      setState(() {});
    });
    animation = new Tween(begin: 1.0, end: 0.8).animate(curve)..addListener(() {
      setState(() {});
    });
    _colorTween = ColorTween(begin: Color.fromRGBO(0, 0, 0, 0), end: Color.fromRGBO(0, 0, 0, 0.2))
        .animate(controller);
  }
  void onMenu () {
    setState(() {
      openStatus = !openStatus;
      print('open: $openStatus');
      if (!openStatus) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).backgroundColor;
    var primaryColor = Theme.of(context).primaryColor;
    return SafeArea(
      child: Transform.translate(
        offset: Offset(translateXAnimation.value, 0),
        child: Transform.scale(
          scale: animation.value,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundColor,
                  boxShadow: !openStatus ? [] : [BoxShadow(color: _colorTween.value, blurRadius: 20)]
                ),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: topTween.value),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.menu, color: primaryColor,),
                            onTap: onMenu,
                          ),
                          Expanded(child: Text('My Cards', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),),
                          GestureDetector(
                            child:  Icon(Icons.add_circle, color: Colors.blueAccent), 
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (c) => AddBlankCard()));
                            },
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: RecordList(),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: openStatus,
                child: GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                  ),
                  onTap: onMenu,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}