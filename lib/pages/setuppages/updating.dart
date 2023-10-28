import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/navhome.dart';
import 'package:ricovi/pages/setuppages/setupnameframe.dart';
import 'package:svg_flutter/svg.dart';

class UpdatingPage extends StatefulWidget {
  const UpdatingPage({super.key});

  @override
  State<UpdatingPage> createState() => _UpdatingPageState();
}

class _UpdatingPageState extends State<UpdatingPage> {
  bool v=false;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer =Timer(
      Duration(seconds: 3),
      () {
        if(!v){
          Navigator.of(context).push(CustomRoute(child: SetupName(),time:Duration(milliseconds: 1200)));
          v=true;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width*0.4,
                child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,)
              )
            ),
            SizedBox(height:150),
            Lottie.asset('./lib/assets/updating.json',width: MediaQuery.sizeOf(context).width*0.34),
            SizedBox(height: 20,),
            const Text('Looking for Update',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            const SizedBox(height: 15,),
            const Text('Please wait while we look for \navailable firmware for your AI Frame \nto update',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
            Spacer(),
            Visibility(
              visible: v==false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black,width:3)),
                      fixedSize: Size(MediaQuery.sizeOf(context).width*0.4,50)
                    ),
                    onPressed: (){
                        //Navigator.of(context).pop();
                        _timer.cancel();
                        Navigator.of(context).pushAndRemoveUntil(CustomRoute(child: navHomepage(),time:Duration(milliseconds: 1200)),(Route<dynamic> route) => false);
                    },
                    
                    child: const Text('Skip',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.black87,
                      elevation: 15,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      fixedSize: Size(MediaQuery.sizeOf(context).width*0.4,50)
                    ),
                    onPressed: (){
                      _timer.cancel();
                        Navigator.of(context).pushAndRemoveUntil(CustomRoute(child: navHomepage(),time:Duration(milliseconds: 1200)),(Route<dynamic> route) => false);
                    },
                    
                    child: const Text('Update',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}