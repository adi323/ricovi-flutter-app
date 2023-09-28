import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/setuppages/connected.dart';
import 'package:svg_flutter/svg_flutter.dart';

class WifiPass extends StatefulWidget {
  const WifiPass({super.key});

  @override
  State<WifiPass> createState() => _WifiPassState();
}

class _WifiPassState extends State<WifiPass> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                const Positioned(
                  left: 0,
                  top: 10,
                  child: const Icon(Icons.arrow_back_ios_new_rounded,size: 21,),),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,allowDrawingOutsideViewBox: false,width:MediaQuery.sizeOf(context).width*0.4,),
                ),
              ],
            ),
            
            const SizedBox(height: 80,),
            const Text('Enter your Wi-Fi password',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
            const SizedBox(height: 20,),
            const Text('Password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black87,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: (){
                  Navigator.of(context).pushReplacement(CustomRoute(child: ConnectedDevice(),time:Duration(milliseconds: 1200)));
              },
              
              child: const Text('Connect',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
      ),
    );
  }
}