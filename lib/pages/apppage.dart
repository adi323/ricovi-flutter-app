import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/apppages/calendarPage.dart';
import 'package:ricovi/pages/apppages/clockpage.dart';
import 'package:ricovi/pages/apppages/newspage.dart';
import 'package:ricovi/pages/apppages/taskpage.dart';
import 'package:svg_flutter/svg.dart';

// ignore: must_be_immutable
class AppPage extends StatefulWidget {
  AppPage({super.key,required this.tc});
  TabController tc;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage>  with TickerProviderStateMixin{

  
  //bool showtodo=false;
  late TabController tc2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc2=TabController(length: 4, vsync: this);

    tc2.addListener(() { 
      setState(() {
      });
      print("Selected Index2: " + tc2.index.toString());
    });
  }

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
      body: Column(
        //padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 50,offset:const Offset(0, 4),spreadRadius: 0,color: Colors.black.withOpacity(0.05))]
            ),
            height: 190,
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Screen Settings",style: bold24().copyWith(fontWeight: FontWeight.w500,fontSize: 20),),
                const SizedBox(height:10),
                Text('Select a feature to Customize your screen ',style: medium14().copyWith(color: Colors.black45),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(0);

                      },
                      child: TabbarWidget('./lib/assets/icons/calendar.svg', "Calendar",tc2.index==0),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(1);
                        
                      },
                      child: TabbarWidget('./lib/assets/icons/todo.svg', "Tasks",tc2.index==1),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(2);
                      },
                      child: TabbarWidget('./lib/assets/icons/news.svg', "News",tc2.index==2),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(3);
                      },
                      child: TabbarWidget('./lib/assets/icons/clock.svg', "Clock",tc2.index==3)
                    )
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height-385,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tc2,
              children:const [
                CalendarPage(),
                TasksPage(),
                NewsPage(),
                clockPage()
              ],
             )
          )
          

        ],
      )
      
      
      
    );
  }
  
  
  Widget TabbarWidget(String assetname, String txt,bool active){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:!active?Colors.black45.withOpacity(0.2): Colors.black,width: 2),
          ),
          child: SvgPicture.asset(assetname,height: 25,width: 25,fit: BoxFit.scaleDown,color:!active?Colors.black45.withOpacity(0.2): Colors.black),
        ),
        const SizedBox(height: 10,),
        Text(txt,style: medium12().copyWith(color: !active?Colors.black45.withOpacity(0.2):Colors.black),)
      ],
    );
  }
}