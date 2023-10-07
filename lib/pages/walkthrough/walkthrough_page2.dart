import 'package:flutter/material.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/fourdots.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/walkthrough/walkthrough_page3.dart';

class WalkthroughPage2 extends StatelessWidget {
  const WalkthroughPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(image: const AssetImage('./lib/assets/walkthrough2.png'),height: MediaQuery.sizeOf(context).height*0.50,fit: BoxFit.fill,),
              Positioned(
                bottom: 25,
                child: fourdots(1)
              )
            ],
          ),
          Container(
            height: MediaQuery.sizeOf(context).height*0.50,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30,),
                Text("Display Your Art & Photos with Style",style: bold36(),),
                const SizedBox(height: 20,),
                Text("PHOTOS, VIDEOS, ART & MUCH MORE...",style: medium16(),),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black87,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: (){
                      //cnt.signupbuttonpressed(context);
                      Navigator.of(context).pushReplacement(CustomRoute(child: const WalkthroughPage3(),time:const Duration(milliseconds: 1200)));
                  },
                  
                  child: const Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                const SizedBox(height: 30,),
              ],
            ),
          )
        ],
      ),
    );
  }
}