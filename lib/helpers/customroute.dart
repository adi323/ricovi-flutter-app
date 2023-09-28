import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget child;
  final Duration time;

  CustomRoute({
    required this.child,
    required this.time
  }):super(
    barrierColor: Colors.black,
    transitionDuration: time,
    reverseTransitionDuration: time,
    pageBuilder: (context,animation,secondaryAnimation)=>child);


  @override
  Widget buildTransitions(BuildContext context,Animation<double> animation,Animation<double> secondaryAnimation, Widget child){
    return FadeTransition(
      
     opacity: animation,
      child: child,
    );
  }
}