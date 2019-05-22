import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:floryday/Home.dart';
import 'package:floryday/MenuList.dart';
import 'package:floryday/CustomThemeData.dart';
import 'package:floryday/TabbarPage.dart';

void main() async{
  await getStorageTheme();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of(context);
    return StreamBuilder(
      initialData: bloc.value,
      stream: bloc.stream,
      builder: (context, snapshot) {
        ThemeObject colors =snapshot.data;
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: colors.primaryColor, // Color for Android
          statusBarBrightness: bloc.themeName != 'Theme1' ? Brightness.dark : Brightness.light
        ));
        return Scaffold(
          backgroundColor: colors.backgroundColor,
          body: Stack(children: <Widget>[
              MenuListWidget(),
              HomeWidget()
            ]
          )
        );
      }
    );
  }
}
