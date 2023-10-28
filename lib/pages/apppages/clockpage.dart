import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

class clockPage extends StatefulWidget {
  const clockPage({super.key});

  @override
  State<clockPage> createState() => _clockPageState();
}

class _clockPageState extends State<clockPage> {

  bool showcur=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: ListView(
          shrinkWrap: true,
          
          children: [
            Text("Weather Source",style: medium16(),),
            const SizedBox(height: 10,),
            Container(
              height: 70,
              width: MediaQuery.sizeOf(context).width-50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border:Border.all(color: Colors.black.withOpacity(0.05),width:2)),
              child: Row(
                children: [
                  SvgPicture.asset('./lib/assets/icons/weather.svg',height: 30,fit: BoxFit.scaleDown,width: 30,),
                  const SizedBox(width: 20,),
                  Text("WeatherBit",style: medium16(),),
                  
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Text("Location",style: medium16(),),
            const SizedBox(height: 10,),
            
            const SizedBox(height: 30,),
            Row(
              children: [
                Checkbox(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(width: 2,color: Colors.black)),
                  value: showcur,
                  onChanged: (p){
                    print(showcur);
                    setState(() {
                      showcur=p!;
                    });
                  }
                ),
                SizedBox(width: 10,),
                Text('Show the current condition',style: medium16(),)
              ],
            ),
            SizedBox(height:30),
            CustomSlidingSegmentedControl<int>(
              height: 60,
              innerPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              children: {
                0: Text("Celsius",style: medium14(),),
                1: Text("Farenheit",style: medium14(),)
              },
              //splashColor: Colors.white.withOpacity(0.1),
              decoration: BoxDecoration(
                color: CupertinoColors.lightBackgroundGray,
                borderRadius: BorderRadius.circular(10),
              ),
              
              //splashFactory: InkRipple.splashFactory,
              fromMax: false,
              clipBehavior: Clip.hardEdge,
              isStretch: true,
              thumbDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              onValueChanged: (int value) {
                switch (value) {
                  case 0:
                    print(value);
                    setState(() {
                      
                    });
                    break;
                  case 1:
                    print(value);
                    setState(() {
                      
                    });
                    break;
                  default:
                }
              },
            ),
            const SizedBox(height: 30,),
            Text("Time Format",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              value:"hh:mm",
              focusColor: Colors.white,
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                
                
              ),
              icon: const Icon(Icons.arrow_drop_down,color: Colors.black45,size: 35,),//
              items: [
                  DropdownMenuItem(value: 'hh:mm',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(DateFormat("HH:mm").format(DateTime.now()),style: medium12(),)
                ),),
                DropdownMenuItem(value: 'hh:mm a',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(DateFormat("hh:mm a").format(DateTime.now()),style: medium12(),)
                ),),
                
              ], 
              onChanged: (val){}),
            const SizedBox(height: 30,),
            Text("Date Format",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              value:"dddd, eeee dd",
              focusColor: Colors.white,
              decoration: InputDecoration(
                
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                
                
              ),
              icon: const Icon(Icons.arrow_drop_down,color: Colors.black45,size: 35,),//
              items: [
                  DropdownMenuItem(value: 'dddd, eeee dd',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(DateFormat.yMMMMEEEEd().format(DateTime.now()),style: medium12(),)
                ),),
                DropdownMenuItem(value: 'dd mm yy',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(DateFormat.yMEd().format(DateTime.now()),style: medium12(),)
                ),),
                
              ], 
              onChanged: (val){}),
            const SizedBox(height: 30,),
            Text("Time Zone",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              value:"+5:30",
              focusColor: Colors.white,
              decoration: InputDecoration(
                
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                
                
              ),
              icon: const Icon(Icons.arrow_drop_down,color: Colors.black45,size: 35,),//
              items: [
                  DropdownMenuItem(value: '+5:30',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("Asia/Kolkata (GMT+5:30)",style: medium12(),)
                ),),
                DropdownMenuItem(value: '-5:30',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("USA (GMT-5:30)",style: medium12(),)
                ),),
                
              ], 
              onChanged: (val){}),
          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shadowColor: Colors.black87,
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            minimumSize: const Size.fromHeight(60),
          ),
          onPressed: (){
            //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?navHomepage():OtpScreen(),time:Duration(milliseconds: 1200)));
          },
          
          child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),))
      ),
    );
  }
}