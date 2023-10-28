import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/customthumb.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';
import 'package:ricovi/controller/settingscontroller.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/homepage/settings/accountpage.dart';
import 'package:ricovi/pages/homepage/settings/schedulepage.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ricovi/helpers/customDivider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {

    return GetBuilder<settingscontroller>(
      init: Get.put(settingscontroller()),
      builder: (cnt)=>Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
          title: Text('Settings',style: bold24(),textAlign: TextAlign.center,),
          systemOverlayStyle: SystemUiOverlayStyle.dark
        ),
        backgroundColor: Colors.white,
        body:Obx(
          ()=> ListView(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Navigator.of(context).push(CustomRoute(child: const AccountPage(), time: const Duration(milliseconds: 500)));
                },
                child: settingItem('./lib/assets/icons/user.svg', "My Account",false,false,null),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  devicenamechange(context,cnt);
                },
                child: settingItem('./lib/assets/icons/device.svg', "Device name",false,true,cnt.deviceValue.toString()),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  framechange(context, cnt);
                },
                child: settingItem('./lib/assets/icons/orientation.svg', "Frame orientation",false,true,cnt.frame.toString()),
              ),
              settingItem('./lib/assets/icons/music.svg', "Background music",true,false,null),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Navigator.of(context).push(CustomRoute(child: const SchedulePage(), time: const Duration(milliseconds: 500)));
                },
                child: settingItem('./lib/assets/icons/clock.svg', "Schedule",true,false,null),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  sleepvalue(context, cnt);
                },
                child: settingItem('./lib/assets/icons/sleep.svg', "Sleep",true,false,null),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  transitionchange(context, cnt);
                },
                child: settingItem('./lib/assets/icons/comapre.svg', "Image transition effect",false,true,cnt.imagetrans.toString()),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  imginterval(context,cnt);
                },
                child: settingItem('./lib/assets/icons/interval.svg', "Image interval",false,true,cnt.imginterval.toString()),
              ),
              settingItem('./lib/assets/icons/wifi.svg', "Wifi Settings",false,true,cnt.wifiname.toString()),
              settingItem('./lib/assets/icons/integrations.svg', "Apps & Integrations",true,false,null),
              const SizedBox(height: 30,),
              settingItem('./lib/assets/icons/membership.svg', "Membership",true,true,null),
              settingItem('./lib/assets/icons/help.svg', "Help & Support",true,true,null),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  aboutbuilder(context, cnt);
                },
                child: settingItem('./lib/assets/icons/device.svg', "About",true,false,null),
              ),
            ],
          )
        ),
      )
    );
  }

  framechange(BuildContext context,settingscontroller cnt){
    RxString opted=cnt.frame.value.obs;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
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
              Text("Frame Orientation",style: medium16().copyWith(fontWeight: FontWeight.w600),),
              const SizedBox(height: 42,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      setState(() {
                        opted.value="Landscape";
                      });
                    },
                    child: Row(
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: SvgPicture.asset('./lib/assets/icons/device.svg',color:opted.value=="Landscape"?Colors.black:Colors.grey),
                        ),
                        const SizedBox(width: 15,),
                        Text("Landscape",style: medium14().copyWith(color:opted.value=="Landscape"?Colors.black:Colors.grey),),
                      ],
                    )
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      
                      setState(() {
                        opted.value="Potrait";
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('./lib/assets/icons/device.svg',color:opted.value=="Potrait"?Colors.black:null),
                        
                        const SizedBox(width: 15,),
                        Text("Potrait",style: medium14().copyWith(color:opted.value=="Potrait"?Colors.black:Colors.grey),),
                      ],
                    )
                  )
                ],
              ),
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
                  cnt.changeframe(opted.value);
                  Navigator.of(context).pop();
                  
                },
                
                child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
            ],
          ),
        )
      )
    );
  }




  devicenamechange(BuildContext context,settingscontroller cnt){
    TextEditingController txt=new TextEditingController();
    showDialog(
      
      context: context, 
      builder: (context)=>Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        insetPadding: const EdgeInsets.all(8),
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child:Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 23),
              width: 366,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Device Name",style: medium16().copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(height: 42,),
                  TextFormField(
                    controller: txt,
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                      filled: true,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black)),
                      
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                      hintText: 'Enter Your Device Name',
                    ),
                  ),
                  const SizedBox(height:20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.black87,
                      elevation: 15,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      minimumSize: const Size.fromHeight(60),
                    ),
                    onPressed: (){
                      cnt.changedevicevalue(txt.toString());
                      Navigator.of(context).pop();
                        //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?Homepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                    },
                    
                    child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                ],
              ),
            )
          )
        )
      )
    );
  }


  transitionchange(BuildContext context,settingscontroller cnt){
    RxString opted=cnt.imagetrans.value.obs;
    showDialog(
      context: context, 
      builder: (context)=>Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        insetPadding: const EdgeInsets.all(5),
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child:Obx(
            ()=> Container(
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 34,vertical: 23),
              width: 366,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Image Transition effect",style: medium16().copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(height: 42,),
                  Row(
                    
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            opted.value="Fade";
                          });
                        },
                        child: Text("Fade",style: medium14().copyWith(color:opted.value=="Fade"?Colors.black:Colors.grey),),
                      ),
                      const SizedBox(width:20),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          
                          setState(() {
                            opted.value="Left to right";
                          });
                        },
                        child: Text("Left to right",style: medium14().copyWith(color:opted.value=="Left to right"?Colors.black:Colors.grey),),
                      ),
                      const SizedBox(width:20),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          
                          setState(() {
                            opted.value="Right to left";
                          });
                        },
                        child: Text("Right to left",style: medium14().copyWith(color:opted.value=="Right to left"?Colors.black:Colors.grey),),
                      )
                    ],
                  ),
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
                      cnt.changeimagetrans(opted.value);
                      Navigator.of(context).pop();
                      
                    },
                    
                    child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                ],
              ),
            )
          )
        )
      )
    );
  }



  RxDouble _thumbStrokeSliderValue = 10.0.obs;
  imginterval(BuildContext context,settingscontroller cnt){
    
    showDialog(
      context: context,
      
      builder: (context)=>Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        insetPadding: const EdgeInsets.all(5),
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
          child:Container(
        
            padding: const EdgeInsets.fromLTRB(34, 23, 34, 23),
            width: 366,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Image Interval",style: medium16().copyWith(fontWeight: FontWeight.w600),),
                const SizedBox(height: 42,),
                aboutitem("Sleep in", cnt.imginterval.value, false),
                SfSliderTheme(
                  data: SfSliderThemeData(
                    inactiveDividerColor: Colors.grey.shade300,
                    activeDividerColor: Colors.black,
                    activeDividerStrokeWidth: 0,
                    activeDividerStrokeColor: Colors.deepOrange.withOpacity(0.24),
                    inactiveDividerStrokeWidth: 0,
                    inactiveDividerStrokeColor: Colors.grey,
                    activeTrackColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    overlayColor: Colors.black.withOpacity(0.12),
                    thumbColor: Colors.black,
                    thumbStrokeWidth: 2.0,
                    tooltipBackgroundColor: Colors.black,
                    thumbStrokeColor: Colors.black),
                  child: Obx(
                    ()=> SfSlider(
                      interval: 1,
                      stepSize: 1,
                      showDividers: true,
                      dividerShape: CustomDividerShape(),
                      min: 0,
                      max: 30,
                      thumbShape: CustomThumbShape(),
                      value: _thumbStrokeSliderValue.value,
                      onChanged: (dynamic values) {
                        print(_thumbStrokeSliderValue);
                        setState(() {
                          _thumbStrokeSliderValue.value = values as double;
                        });
                      },
                      enableTooltip: false,
                      numberFormat: NumberFormat('#')
                    )
                  )
                ),
                const SizedBox(height: 22,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.black87,
                      elevation: 15,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      minimumSize: const Size.fromHeight(60),
                    ),
                    onPressed: (){
                      cnt.changeimginterval(_thumbStrokeSliderValue.value);
                      Navigator.of(context).pop();
                      
                    },
                    
                    child: const Text('Set',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                ],
              ),
          ),
        )
      )
    );
  }

  RxDouble _thumbsleepvalue = 10.0.obs;
  sleepvalue(BuildContext context,settingscontroller cnt){
    
    showDialog(context: context, builder: (context)=> Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      insetPadding: const EdgeInsets.all(5),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
        child:Container(
        
          padding: const EdgeInsets.fromLTRB(34, 23, 34, 23),
          width: 366,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Image Interval",style: medium16().copyWith(fontWeight: FontWeight.w600),),
              const SizedBox(height: 42,),
              aboutitem("Sleep in", cnt.imginterval.value, false),
              SfSliderTheme(
                data: SfSliderThemeData(
                  inactiveDividerColor: Colors.grey.shade300,
                  activeDividerColor: Colors.black,
                  activeDividerStrokeWidth: 0,
                  activeDividerStrokeColor: Colors.deepOrange.withOpacity(0.24),
                  inactiveDividerStrokeWidth: 0,
                  inactiveDividerStrokeColor: Colors.grey,
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.white,
                  overlayColor: Colors.black.withOpacity(0.12),
                  thumbColor: Colors.black,
                  thumbStrokeWidth: 2.0,
                  tooltipBackgroundColor: Colors.black,
                  thumbStrokeColor: Colors.black),
                child: Obx(
                  ()=> SfSlider(
                    interval: 1,
                    stepSize: 1,
                    showDividers: true,
                    dividerShape: CustomDividerShape(),
                    min: 0,
                    max: 30,
                    thumbShape: CustomThumbShape(),
                    value: _thumbsleepvalue.value,
                    onChanged: (dynamic values) {
                      setState(() {
                        _thumbsleepvalue.value = values as double;
                      });
                    },
                    enableTooltip: false,
                    numberFormat: NumberFormat('#')
                  )
                )
              ),
              const SizedBox(height: 22,),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black87,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: (){
                    
                    Navigator.of(context).pop();
                    
                  },
                  
                  child: const Text('Sleep',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
            ],
          ),
        )
      )
    ));
  }

  aboutbuilder(BuildContext context,settingscontroller cnt){
    showDialog(context: context, builder: (context)=> Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      elevation: 0,
      insetPadding: EdgeInsets.all(5),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.transparent),
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
        child: Container(
        
        padding: const EdgeInsets.fromLTRB(34, 23, 34, 15),
        width: 366,
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("About",style: medium16().copyWith(fontWeight: FontWeight.w600),),
            const SizedBox(height: 42,),
            aboutitem("Status", "Online", true),
            aboutitem("Wifi Settings", cnt.wifiname.value, false),
            aboutitem("Last Sync", DateFormat("dd MMM, yyyy").format(DateTime.now()), false),
            aboutitem("Local IP Address", "192.168.29.9", false),
            aboutitem("Free Space", "2GB of 4GB", false),
            const SizedBox(height: 22,),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                  
                  Navigator.of(context).pop();
                  
                },
                
                child: const Text('Close',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        ),
      )
      )
    ));
  }

  Widget aboutitem(String title,String text,bool online){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(title,style: medium14(),),
          const Spacer(),
          Row(
            children: [
              online?Container(width: 5,height: 5,decoration: const BoxDecoration(shape: BoxShape.circle,color:Color(0xFF00FF0A)),):const SizedBox(),
              const SizedBox(width: 10,),
              Text(text,style: medium14().copyWith(color:online?Colors.black:Colors.grey),)
            ],
          )
        ],
      )
    );
  }

  Widget settingItem(String iconname,String icontext,bool showicon,bool stringpres,String? text){
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          SvgPicture.asset(iconname,),
          const SizedBox(width: 30,),
          Text(icontext,style: medium16().copyWith(fontWeight: FontWeight.w600),),
          const Spacer(),
          showicon?const Icon(Icons.arrow_forward_ios_rounded,size: 18,):!stringpres?const SizedBox():Text(text!,style: medium14(),),
        ],
      )
    );
  }
}







