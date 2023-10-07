import 'package:flutter/material.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/fourdots.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/setuppages/setupframe.dart';

class WalkthroughPage4 extends StatelessWidget {
  const WalkthroughPage4({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(image: const AssetImage('./lib/assets/walkthrough4.png'),height: MediaQuery.sizeOf(context).height*0.50,fit: BoxFit.fill,),
              Positioned(
                bottom: 25,
                child: fourdots(3)
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
                Text("Get arts for the artist directly to your home",style: bold36(),),
                const SizedBox(height: 20,),
                Text("We collaborated with artists to give you access to their art where ever you are.",style: medium16(),),
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
                      Navigator.of(context).pushReplacement(CustomRoute(child: const SetupFrame(),time:const Duration(milliseconds: 1200)));
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