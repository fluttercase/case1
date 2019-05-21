import 'package:flutter/material.dart';
import './RecordList.dart';

class HomeWidget extends StatefulWidget{
  HomeWidget({Key key}) : super(key: key);

  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin{
  AnimationController  controller, _topController;
  AnimationController  controller1;
  bool openStatus = false;
  Animation<double> animation;
  Animation<double> translateXAnimation;
  Animation<double> topTween;

  int aniTime = 300;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: Duration(milliseconds: aniTime), vsync: this);
    controller1 = new AnimationController(duration: Duration(milliseconds: aniTime), vsync: this);
    _topController = new AnimationController(vsync: this, duration: Duration(milliseconds: aniTime));


    topTween = new Tween(begin:  0.0, end: 10.0).animate(_topController)..addListener((){
      setState(() {});
    });

    Animation curve = new CurvedAnimation(parent: controller, curve: Curves.linear);
    translateXAnimation = new Tween(begin: 0.0, end: 200.0).animate(controller1)..addListener(() {
      setState(() {});
    });
    animation = new Tween(begin: 1.0, end: 0.8).animate(curve)..addListener(() {
      setState(() {});
    });
  }
  void onMenu () {
    setState(() {
      openStatus = !openStatus;
      print('open: $openStatus');
      if (!openStatus) {
        controller.reverse();
        controller1.reverse();
        _topController.reverse();
      } else {
        controller.forward();
        controller1.forward();
        _topController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print('translateXAnimation: ${translateXAnimation.value}');

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
                  color: Color(0xff343442),
                  boxShadow: !openStatus ? [] : [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.2), blurRadius: 20)]
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: topTween.value),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.white,),
                          onTap: onMenu,
                        ),
                        Expanded(child: Text('My Cards', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),),
                        Icon(Icons.add_circle, color: Colors.white)
                      ],
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