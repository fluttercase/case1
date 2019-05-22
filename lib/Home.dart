import 'package:flutter/material.dart';
import 'package:floryday/RecordList.dart';
import 'package:floryday/Carousel.dart';
import 'package:floryday/CustomThemeData.dart';

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
  int selectedPage = 0;
  PageController _pctrl;
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
    _colorTween = ColorTween(begin: Color.fromRGBO(0, 0, 0, 0), end: Color.fromRGBO(0, 0, 0, 0.2)).animate(controller);
    _pctrl = PageController(initialPage: 0, keepPage: false);
    _pctrl.addListener((){
      
    });
  }
  void onMenu () {
    setState(() {
      openStatus = !openStatus;
      if (!openStatus) {
        controller.reverse();
      } else {
        controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData bloc = BlocProvider.of(context);
    return SafeArea(
      child: Transform.translate(
        offset: Offset(translateXAnimation.value, 0),
        child: Transform.scale(
          scale: animation.value,
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              StreamBuilder(
                initialData: bloc.value,
                stream: bloc.stream,
                builder: (context, snapshot) {
                  ThemeObject colors =snapshot.data;
                  // return _body(colors);
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: !openStatus ? [] : [BoxShadow(color: _colorTween.value, blurRadius: 20)],
                      color: colors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pctrl,
                            itemCount: 4,
                            itemBuilder: (c, index) {
                              if (index == 0) {
                                return _body(colors);
                              } else {
                                return Text('Page $index');
                              }
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Color.fromRGBO(100, 100, 100, 0.1), blurRadius: 2, spreadRadius: 2, offset: Offset(0, -4))],
                            color: colors.backgroundColor
                          ),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Material(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.backgroundColor,
                                  child: InkWell(
                                    child:  Icon(Icons.home, color: selectedPage == 0 ? Colors.blueAccent :colors.primaryColor,),
                                    onTap:  () {changeTab(0);},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  color: colors.backgroundColor,
                                  child: InkWell(
                                    child:  Icon(Icons.share, color: selectedPage == 1 ? Colors.blueAccent :colors.primaryColor,),
                                    onTap:  () {changeTab(1);},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  color: colors.backgroundColor,
                                  child: InkWell(
                                    child:  Icon(Icons.settings, color: selectedPage == 2 ? Colors.blueAccent :colors.primaryColor,),
                                    onTap:  () {changeTab(2);},
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(10),
                                  color: colors.backgroundColor,
                                  child: InkWell(
                                    child:  Icon(Icons.person_pin_circle, color: selectedPage == 3 ? Colors.blueAccent :colors.primaryColor,),
                                    onTap:  () {changeTab(3);},
                                  ),
                                ),
                              ),
        
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
              Visibility(
                visible: openStatus,
                child: Positioned(
                  child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: onMenu,
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
  void changeTab (int page) {
    print(page);
    setState(() {
      selectedPage = page;
    });
    _pctrl.jumpToPage(page);
  }
  Widget _body (ThemeObject colors) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.menu, color: colors.primaryColor,),
                    onTap: onMenu,
                  ),
                  Expanded(child: Text('My Cards', style: TextStyle(color: colors.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),),
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
              child: RecordList(color: colors.primaryColor,),
            )
          ],
        ),
      );
  }
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}