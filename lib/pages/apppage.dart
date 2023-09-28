import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

class AppPage extends StatefulWidget {
  AppPage({super.key,required this.tc});
  TabController tc;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {

  int index=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:50,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 25),
          onPressed: (){
            widget.tc.animateTo(0);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 25,
        )),
      ),
      body: ListView(
        //padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 50,offset:const Offset(0, 4),spreadRadius: 0,color: Colors.black.withOpacity(0.05))]
            ),
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Screen Settings",style: bold24().copyWith(fontWeight: FontWeight.w500,fontSize: 20),),
                SizedBox(height:10),
                Text('Select a feature to Customize your screen ',style: medium14().copyWith(color: Colors.black45),),
                SizedBox(height: 20,),
                AnimatedContainer(
                  
                  duration: const Duration(milliseconds: 1000),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            index=0;
                          });

                        },
                        child: TabbarWidget('./lib/assets/icons/calendar.svg', "Calendar",index==0),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            index=1;
                          });
                          
                        },
                        child: TabbarWidget('./lib/assets/icons/todo.svg', "Tasks",index==1),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            index=2;
                          });
                        },
                        child: TabbarWidget('./lib/assets/icons/news.svg', "News",index==2),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){
                          setState(() {
                            index=3;
                          });
                        },
                        child: TabbarWidget('./lib/assets/icons/clock.svg', "Clock",index==3)
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),


          AnimatedContainer(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 25),
            duration: Duration(milliseconds: 1000),
            child: Stack(
              children: [
                Visibility(
                  visible: index==0,
                  child: Column(
                    children: [
                      Text("Calendar Source",style: bold24().copyWith(fontWeight: FontWeight.w500,fontSize: 20),),
                    ],
                  ),
                ),
                Visibility(
                  visible: index==1,
                  child: Center(child: Text("Tasks"),),
                ),
                Visibility(
                  visible: index==2,
                  child: Center(child: Text("News"),),
                ),
                Visibility(
                  visible: index==3,
                  child: Center(child: Text("Clock"),),
                )
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
          child: SvgPicture.asset(assetname,height: 25,width: 25,fit: BoxFit.scaleDown,),
        ),
        const SizedBox(height: 10,),
        Text(txt,style: medium12().copyWith(color: !active?Colors.black45.withOpacity(0.2):Colors.black),)
      ],
    );
  }
}