import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  bool showtodo=false;
  bool showcompleted=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: ListView(
          shrinkWrap: true,
          
          children: [
            Text("To-Do Source",style: medium16(),),
            const SizedBox(height: 10,),
            Container(
              height: 70,
              width: MediaQuery.sizeOf(context).width-50,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border:Border.all(color: Colors.black.withOpacity(0.05),width:2)),
              child: Row(
                children: [
                  SvgPicture.asset('./lib/assets/icons/gtasks.svg',height: 30,fit: BoxFit.scaleDown,width: 30,),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Google Tasks",style: medium16(),),
                      Text("IA@gmail.com",style:  medium12().copyWith(color: Colors.black45),),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('./lib/assets/icons/unlink.svg',height: 30,fit: BoxFit.scaleDown,width: 30,),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Text("List Name",style: medium16(),),
            const SizedBox(height: 10,),
            DropdownButtonFormField(
              elevation: 0,
              focusColor: Colors.white,
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black.withOpacity(0.05))),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                
                hintText: 'List Name',
                
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
            Row(
              children: [
                Checkbox(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(width: 2,color: Colors.black)),
                  value: showtodo,
                  onChanged: (p){
                    print(showtodo);
                    setState(() {
                      showtodo=p!;
                    });
                  }
                ),
                SizedBox(width: 10,),
                Text('Show to-do notes',style: medium16(),)
              ],
            ),
            Row(
              children: [
                Checkbox(
                  
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(width: 2,color: Colors.black)),
                  value: showcompleted,
                  onChanged: (p){
                    print(showcompleted);
                    setState(() {
                      showcompleted=p!;
                    });
                  }
                ),
                SizedBox(width: 10,),
                Text('Show completed tasks',style: medium16(),),
                
              ],
            ),
          
            
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