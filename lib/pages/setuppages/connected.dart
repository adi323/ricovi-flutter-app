import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:ricovi/pages/setuppages/updating.dart';
import 'package:svg_flutter/svg.dart';

import '../../helpers/customroute.dart';

class ConnectedDevice extends StatefulWidget {
  const ConnectedDevice({super.key});

  @override
  State<ConnectedDevice> createState() => _ConnectedDeviceState();
}

class _ConnectedDeviceState extends State<ConnectedDevice> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(CustomRoute(child: UpdatingPage(),time:Duration(milliseconds: 1200)));
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
            Stack(
              alignment: Alignment.center,
              children: [
                
                const Image(image: AssetImage('./lib/assets/connectedimg.png'),filterQuality: FilterQuality.high,),
                Lottie.asset('./lib/assets/connected.json',width: 110),
              ],
            ),
            SizedBox(height: 20,),
            const Text('Connected',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            const SizedBox(height: 15,),
            const Text('Congratulations your AI Frame is\n ready to use ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
            Spacer()
          ],
        )
      ),
    );
  }
}