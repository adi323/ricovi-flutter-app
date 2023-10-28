import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/aipages/aiimageresult.dart';

class LoadingAiPage extends StatefulWidget {
  LoadingAiPage({super.key,required this.text});
  String text;
  @override
  State<LoadingAiPage> createState() => _LoadingAiPageState();
}

class _LoadingAiPageState extends State<LoadingAiPage> {
  
  bool loggedin=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    Timer(const Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacement(CustomRoute(child: AiImageResult(text: widget.text,),time:Duration(milliseconds: 1200)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: LottieBuilder.asset('./lib/assets/ai_loading.json',width: 192,height: 192,)
            ),
            SizedBox(height: 10,),
            Text("Generating your art",style: medium20(),),
            SizedBox(height: 20,),
            Text("The AI takes a few seconds ro make\nyou imagination to art. Please wait in\nwhile AI is generating",style: medium16().copyWith(color: Colors.black45),textAlign: TextAlign.center,)
          //SvgPicture.asset('./lib/assets/rvector.svg',color: Colors.white,)
          ],
      )),
    );
  }
}