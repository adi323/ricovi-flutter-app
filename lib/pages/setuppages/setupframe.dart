

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/setuppages/setupdevice.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SetupFrame extends StatefulWidget {
  const SetupFrame({super.key});

  @override
  State<SetupFrame> createState() => _SetupFrameState();
}

class _SetupFrameState extends State<SetupFrame> {



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
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width*0.4,
                 child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,)
              )
            ),
            SizedBox(height: 48,),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*1,
                  child: SvgPicture.asset('./lib/assets/back_lamps.svg')
                ),
                Positioned(
                  top: -35,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: SvgPicture.asset('./lib/assets/lamps.svg')
                  )
                )
              ],
            ),
            const Text('Let’s set up your \nAI Frame ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            SizedBox(height: 31,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CustomRoute(child: const SetupDevice(),time:const Duration(milliseconds: 1200)));
              },
              child: Image(image: AssetImage('./lib/assets/framesetup.png'),filterQuality: FilterQuality.high,width: MediaQuery.sizeOf(context).width*0.74,)
            )
          ],
        )
      ),
    );
  }
}