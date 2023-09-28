import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/setuppages/codescanner.dart';
import 'package:ricovi/pages/setuppages/setupwifi.dart';
import 'package:svg_flutter/svg.dart';

class SetupDevice extends StatefulWidget {
  const SetupDevice({super.key});

  @override
  State<SetupDevice> createState() => _SetupDeviceState();
}

class _SetupDeviceState extends State<SetupDevice> {

  List<String> dev=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      setState(() {
        dev.add('AI Canvas 1');
      });
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
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width*0.4,
                 child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,)
              )
            ),

            Column(
              
              children: [
                Lottie.asset('./lib/assets/laoding.json',frameRate: FrameRate(24)),
                const Text('Looking for your Device',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                const SizedBox(height: 15,),
                const Text('Click the device below if it appears\nfrom the network scan',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
                
              ],
            ),
            AnimatedContainer(
              
              duration: Duration(seconds: 2),
              curve: Curves.bounceInOut,
              child: dev.isEmpty? GestureDetector(
                onTap: (){
                  Navigator.of(context).push(CustomRoute(child: Codescanner(),time:Duration(milliseconds: 1200)));
                },
                child: const Column(
                  children: [
                    Text('Can\'t see the device?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
                    SizedBox(height: 10,),
                    Text('Register with a code',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                    
                  ],
                )
              ):GestureDetector(
                onTap: (){
                  Navigator.of(context).push(CustomRoute(child: SetupWifi(),time:Duration(milliseconds: 1200)));
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width-50,
                  padding: EdgeInsets.symmetric(horizontal: 26,vertical: 28),
                  height: 130,
                  decoration: BoxDecoration(border: Border.all(width: 3,color: Colors.black),borderRadius: BorderRadius.circular(15)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Image(image: AssetImage('./lib/assets/canvas1.png'),filterQuality: FilterQuality.high,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text('AI Canvas 1',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                          SizedBox(height: 5,),
                          Text('AI Frame',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
                          
                        ],
                      ),
                    ],
                  )
              ),
              ),
            )
            //SvgPicture.asset('./lib/assets/framesetup.svg')
          ],
        )
      ),
    );
  }
}