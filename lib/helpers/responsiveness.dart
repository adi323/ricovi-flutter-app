import 'package:flutter/material.dart';

class responsiveNess{

  hper(double val,BuildContext context){
    return MediaQuery.sizeOf(context).height*(val/926);
  }

  widper(double val,BuildContext context){
    return MediaQuery.sizeOf(context).width*(val/428);
  }
}