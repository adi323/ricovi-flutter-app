import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/navhome.dart';
import 'package:ricovi/pages/signin/signinpages.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _width = 0;
  double _height = 0;
  bool loggedin=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 100),(){
      setState(() {
        print(_height);
        _height=100;
        _width=250;
        print(_height);
      });
    });
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(CustomRoute(child: !loggedin?navHomepage():navHomepage(),time:Duration(milliseconds: 1200)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
        alignment: Alignment.bottomRight,
        children: [

          SizedBox(height: MediaQuery.sizeOf(context).height,width: MediaQuery.sizeOf(context).width,child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              width: _width,
              height: _height,
              child: SvgPicture.asset('./lib/assets/logo.svg'),
              curve: Curves.fastOutSlowIn,
            ),
          ),),
         SvgPicture.asset('./lib/assets/rvector.svg',color: Colors.white,)
        ],
      )),
    );
  }
}