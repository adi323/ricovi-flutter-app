import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/notifcontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';

class NotficationsPage extends StatefulWidget {
  const NotficationsPage({super.key});

  @override
  State<NotficationsPage> createState() => _NotficationsPageState();
}

class _NotficationsPageState extends State<NotficationsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<notifcontroller>(
      init: Get.put(notifcontroller()),
      builder: (cnt)=>Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
          title: Text('',style: bold24(),textAlign: TextAlign.center,),
          systemOverlayStyle: SystemUiOverlayStyle.dark
        ),
        backgroundColor: Colors.white,
        body:ListView(
          padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
          
          children: [
            Text('Notifications',style: bold24(),textAlign: TextAlign.left,),
            SizedBox(height: 10,),
            Row(
              children: [
                Text('You can turn your notifications\nfrom here ',style: medium14().copyWith(color: Colors.black38),textAlign: TextAlign.left,),
                Spacer(),
                FlutterSwitch(
                  value: cnt.turnedOn.value,
                  onToggle: (p){cnt.changentifypref(p);},
                  width: 52,  
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey,
                  
                  
                ),
                
              ],
            ),

            SizedBox(height: 40,),
            Text('Today',style: medium16().copyWith(color: Colors.black45),textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            ...cnt.lst,
            SizedBox(height: 40,),
            Text('Last 7 days',style: medium16().copyWith(color: Colors.black45),textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            ...cnt.lst2
            

          ]
        )
      )
    );
  }

  

}

