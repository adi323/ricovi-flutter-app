import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: ListView(
          shrinkWrap: true,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Calendar Source",style: medium16(),),
            const SizedBox(height: 10,),
            Container(
              height: 70,
              width: MediaQuery.sizeOf(context).width-50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border:Border.all(color: Colors.black.withOpacity(0.05),width:2)),
              child: Row(
                children: [
                  SvgPicture.asset('./lib/assets/icons/gcalendar.svg',height: 30,fit: BoxFit.scaleDown,width: 30,),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Google Calendar",style: medium16(),),
                      Text("IA@gmail.com",style:  medium12().copyWith(color: Colors.black45),),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('./lib/assets/icons/unlink.svg',height: 30,fit: BoxFit.scaleDown,width: 30,),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Text("Calendar Type",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              value: 'Agenda',
              focusColor: Colors.white,
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Enter your password',
                
              ),
              icon: const Icon(Icons.arrow_drop_down,color: Colors.black45,size: 35,),//
              items: [
                  DropdownMenuItem(value: 'Agenda',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset('./lib/assets/icons/todo.svg',height: 20,width: 20,fit: BoxFit.scaleDown,),
                      const SizedBox(width: 15,),
                      Text("Agenda",style: medium12(),)
                    ],
                  )
                ),),
                DropdownMenuItem(value: 'Ricovi',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset('./lib/assets/icons/clock.svg',height: 20,width: 20,fit: BoxFit.scaleDown,),
                      const SizedBox(width: 15,),
                      Text("Ricovi",style: medium12(),)
                    ],
                  )
                ),),
                DropdownMenuItem(value: 'Hello',child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: [
                      SvgPicture.asset('./lib/assets/icons/todo.svg',height: 20,width: 20,fit: BoxFit.scaleDown,),
                      const SizedBox(width: 15,),
                      Text("Hello",style: medium12(),)
                    ],
                  )
                ),),
              ], 
              onChanged: (val){}),
            const SizedBox(height: 30,),
            Text("Days to Show",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              value: 2,
              focusColor: Colors.white,
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Enter your password',
                
              ),
              icon: const Icon(Icons.arrow_drop_down,color: Colors.black45,size: 35,),//
              items: [
                  DropdownMenuItem(value: 1,child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("1",style: medium12(),)
                ),),
                DropdownMenuItem(value: 2,child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("2",style: medium12(),)
                ),),
                DropdownMenuItem(value: 3,child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("3",style: medium12(),)
                ),),
                DropdownMenuItem(value: 4,child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text("4",style: medium12(),)
                ),),
                ], 
              onChanged: (val){}),
            
          ],
        )
      ),
      bottomNavigationBar: Padding(
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