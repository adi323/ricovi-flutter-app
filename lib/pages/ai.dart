import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';

import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/aipages/loadingaipage.dart';

// ignore: must_be_immutable
class AiPage extends StatefulWidget {
  AiPage({super.key,required this.tc});
  TabController tc;
  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {

  TextEditingController txt=new TextEditingController();
  List<String> filterlist=[
    "Futuristic",
    "Steampunk",
    "Cartoon",
    "UnderWater",
    "Music-inspired",
    "3D",
    "Sketch",
    "Vintage",
    
    "Cubism",
    "Fashion-inspired",
    "Pop Art",
    "Inspired",
    "Oil Painting",
    
    "Still Photography",
    "Black & White"
  ];
  List<String> selected=[];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:50,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          onPressed: (){
            widget.tc.animateTo(0,curve: Curves.easeInOut);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 25,
        )),
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("AI art",style: medium20(),),
            SizedBox(height: 10,),
            Text("Enter your prompt to turn Your Imagination Into a Stunning AI Art", style: medium14().copyWith(color: Colors.black45),),
            SizedBox(height: 20,),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                TextFormField(
                  controller: txt,
                  style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontSize: 16),
                  cursorColor: Colors.black,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(250),
                  ],
                  maxLines: 5,
                  decoration: InputDecoration(
                    fillColor: const Color(0xFFFFFFFF).withOpacity(0.3),
                    filled: true,
                    
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                    hintText: 'Enter your prompt here',
                    
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.black87,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(110, 40),
                    ),
                    onPressed: (){
                      txt.text="Anime girl in realistic look Accent Lighting, A winding path illuminated by a million stars, vivid and rich colors, bright studio";
                        //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?navHomepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                    },
                    
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Icon(Icons.auto_awesome_outlined,size: 20,),
                      SizedBox(width: 10,),
                      Text('Random',style: medium14().copyWith(color: Colors.white)),
                    ],),)
                ),

              ],
            ),
            
            SizedBox(height: 20,),
            CustomSlidingSegmentedControl<int>(
              height: 60,
              innerPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              children: {
                0: Text("Landscape",style: medium14(),),
                1: Text("Potrait",style: medium14(),)
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
            SizedBox(height: 10,),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Wrap(
                    spacing: 5.0,
                    children: filterlist.map((e) => GestureDetector(
                      onTap: (){
                        if(selected.contains(e)){
                          selected.remove(e);
                        }
                        else{
                          selected.add(e);
                        }
                        setState(() {
                          
                        });
                      },
                      child: Chip(
                        label: Text(e),
                        padding: EdgeInsets.all(8),
                        backgroundColor: selected.contains(e)?Colors.white:Colors.black.withOpacity(0.02),
                        side: BorderSide(color: selected.contains(e)?Colors.black:Colors.transparent),)
                    )).toList(),
                    
                  ),
                ],
              )
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black87,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: (){
                Navigator.of(context).push(CustomRoute(child: LoadingAiPage(text: txt.text,),time:Duration(milliseconds: 1200)));
              },
              
              child: Text('Generate',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
             //SizedBox(height: 100,)
           ],
        )
      )
    );
  }
}