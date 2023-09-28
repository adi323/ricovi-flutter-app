import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/setuppages/wifipass.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SetupWifi extends StatefulWidget {
  const SetupWifi({super.key});

  @override
  State<SetupWifi> createState() => _SetupWifiState();
}

class _SetupWifiState extends State<SetupWifi> {
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
            const SizedBox(height: 40,),
            Column(
              children: [
                Text('Connect to your Wifi',style: bold24(),textAlign: TextAlign.center,),
                SizedBox(height: 10,),
                Text('Select Network',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.09,),
            Image(image: AssetImage('./lib/assets/wifismart.png'),filterQuality: FilterQuality.high,width: MediaQuery.sizeOf(context).width*0.5,),
            SizedBox(height: MediaQuery.sizeOf(context).height*0.09,),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              
              itemBuilder: (context,index){
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.of(context).push(CustomRoute(child: WifiPass(),time:Duration(milliseconds: 1200)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text('Wifi ${index}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),textAlign: TextAlign.center,),
                      const Icon(Icons.wifi_1_bar,color: Colors.black,)
                    ],
                  )
                );
              }, 
              separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.black38,height: 41,), 
              itemCount: 4),
              SizedBox(),
              
            
          ],
        )
      ),
    );
  }
}