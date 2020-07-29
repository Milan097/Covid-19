import 'package:coronav2/constant.dart';
import 'package:coronav2/home_screen.dart';
import 'package:coronav2/info_screen.dart';
import 'package:coronav2/screen_status.dart';
import 'package:coronav2/services/world_corona.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chooseLocation.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  Status screen = Status.home;
  Corona curCase;
  MyApp() {
    curCase = Corona(countryName: 'Global', flag: 'gb.png');
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void updateState(Status st) {
    setState(() {
      widget.screen = st;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget myWidget;
    if(widget.screen == Status.info) {
      myWidget = InfoScreen(
        screen: widget.screen,
        updateState: updateState,
      );
    }
    else if(widget.screen == Status.home) {
      print(widget.curCase.countryName);
      myWidget = HomeScreen(
        screen: widget.screen,
        updateState: updateState,
        curCorona: widget.curCase,
      );
    } else if(widget.screen == Status.locations) {
      myWidget = Locations();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: BackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
          body1: TextStyle(color: BodyTextColor),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/locations' : (context) =>  Locations(),
      },

      home: myWidget,
    );
  }
}


