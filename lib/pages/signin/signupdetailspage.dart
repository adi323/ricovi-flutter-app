import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/signin/turnonnotify.dart';
import 'package:svg_flutter/svg.dart';

class SignupDetailsPage extends StatefulWidget {
  const SignupDetailsPage({super.key});

  @override
  State<SignupDetailsPage> createState() => _SignupDetailsPageState();
}

class _SignupDetailsPageState extends State<SignupDetailsPage> {
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
            const SizedBox(height: 20,),
            const Text('We\'d love to know more about you',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
            const SizedBox(height: 20,),
            const Text('Name',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Enter your Full name',
              ),
            ),
            const SizedBox(height: 40,),
            const Text('Phone number',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                
                prefixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('+1',style: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),),
                  ],
                ),
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Your Email Address',
              ),
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
                  Navigator.of(context).pushReplacement(CustomRoute(child: TurnonNotify(),time:Duration(milliseconds: 1200)));
              },
              
              child: const Text('Sign Up',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
      ),
    );
  }
}