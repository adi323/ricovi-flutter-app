import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/signin/personalizeexp.dart';
import 'package:svg_flutter/svg_flutter.dart';

class TurnonNotify extends StatefulWidget {
  const TurnonNotify({super.key});

  @override
  State<TurnonNotify> createState() => _TurnonNotifyState();
}

class _TurnonNotifyState extends State<TurnonNotify> {
  late NotificationSettings settings;
  late FirebaseMessaging messaging;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            Spacer(),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFFD9D9D9).withOpacity(0.2),
                  minRadius: MediaQuery.sizeOf(context).width*0.38/2,
                  child: Lottie.asset('./lib/assets/notify.json'),
                ),
                const SizedBox(height: 20,),
                const Text('Turn on\npush-notifications',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                const Text('Turn on notifications to recieve weekly\nrecomendations',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
              ],
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black87,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: (){
                  Navigator.of(context).pushReplacement(CustomRoute(child: PersonalizeExperience(),time:Duration(milliseconds: 1200)));
              },
              
              child: Text('Turn on',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
      ),
    );
  }
}