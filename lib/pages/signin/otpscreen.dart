import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ricovi/controller/signupcontroller.dart';
import 'package:svg_flutter/svg.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  late Timer _timer;
  int timing=15;
  TextEditingController cnt=new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  void starttimer(){
    var oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          //print(timing);
          if (timing < 1) {
            timer.cancel();
          } else {
            timing = timing - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    starttimer();
    

  }


  void reset(){
    _timer.cancel();
    timing=15;
    starttimer();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<SignupController>(
        init: Get.find<SignupController>(),
        builder:(v)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.4,
                  child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,)
                )
              ),
              const SizedBox(height: 80,),
              const Text('Enter the code',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
              const SizedBox(height: 20,),
              const Text('We sent the code to IA@gmail.com',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              const SizedBox(height: 40,),
              Center(
                child: Pinput(
                  controller: cnt,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 68,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    textStyle: const TextStyle().copyWith(color: Colors.black,fontSize: 30),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(bottom: BorderSide(color: Color(0xFFD9D9D9),width: 3)),
                      //borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  )
                ),
                
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if(timing==0)
                    reset();
                    v.resendotp();
                },
                child: Text(timing!=0?'Resend the code in ${timing} seconds':'Didn\'t recieve code? Resend Code',style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height:25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                    
                    v.verify(context,cnt.text,_timer);
                      //
                },
                
                child: Text('Verify',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
               SizedBox(height:25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(v.otp.toString()),duration: Duration(milliseconds: 2000),backgroundColor: Colors.green,)
                    );
                },
                
                child: Text('Show Otp',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
            ],
          )
        )
      ),
    );
  }
}