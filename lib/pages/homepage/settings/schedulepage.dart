import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ricovi/controller/settingscontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<settingscontroller>(
      init: Get.find<settingscontroller>(),
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
        body:Padding(
          padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
          child: Column(
            //
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Text('Schedule',style: bold24(),textAlign: TextAlign.left,),
              SizedBox(height: 30,),
               schedulewidget(DateTime(0,0,0,2,30), 7, true),
              SizedBox(height: 40,),
              schedulewidget(DateTime(0,0,0,2,30), 7, true),
              
              Spacer(),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  //shadowColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(54),
                ),
                onPressed: (){
                  //cnt.changedevicevalue(txt.toString());
                  //Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context, 
                    builder: (context)=>Obx(
                      ()=> Container(
                        height: 250,
                        padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 23),
                        width: 366,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Add Schedule",style: medium16().copyWith(fontWeight: FontWeight.w600),),
                            const SizedBox(height: 42,),
                            
                            const SizedBox(height:40.62),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shadowColor: Colors.black87,
                                elevation: 15,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                minimumSize: const Size.fromHeight(60),
                              ),
                              onPressed: (){
                                //cnt.changeimagetrans(opted.value);
                                Navigator.of(context).pop();
                                
                              },
                              
                              child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                          ],
                        ),
                      )
                    )
                  );
                    //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?Homepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                },
                
                child: const Text('Add Schedule',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)),
              SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                  //cnt.changedevicevalue(txt.toString());
                  Navigator.of(context).pop();
                    //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?Homepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                },
                
                child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
             ]
          )
        )
      )
    );
  }


  Widget schedulewidget(DateTime dt,int days,bool status){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('hh:mm a').format(dt),style: medium16().copyWith(fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text(days==7?'Everyday':'None',style: medium16().copyWith(color: Colors.black45),),
            SizedBox(height: 10,),
            Text(status?"Turn off":"Turn On",style: medium16()),
          ],
        ),
        Spacer(),
        FlutterSwitch(
          value: status,
          onToggle: (p){},//cnt.changentifypref(p);},
          width: 52,  
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          
          
        ),
      ],
    );
  }
  

}

