import 'package:flutter/material.dart';

Widget fourdots(int n){
  return Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      Container(width:n==0?33:15,height:15,decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),),
      const SizedBox(width: 8,),
      Container(width:n==1?33:15,height:15,decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),),
      const SizedBox(width: 8,),
      Container(width:n==2?33:15,height:15,decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),),
      const SizedBox(width: 8,),
      Container(width:n==3?33:15,height:15,decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),),
    ],
  );
}