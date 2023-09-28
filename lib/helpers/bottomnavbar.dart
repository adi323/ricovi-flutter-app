import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

Widget bottomnavBar(TabController tc){
  return SizedBox(
    height: 180,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: (){

          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal:25,vertical: 15),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.85),boxShadow: [BoxShadow(offset: Offset(0, 0),color: Colors.black26.withOpacity(0.3),)]),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Now Playing", style: medium12().copyWith(color: Colors.black45),),
                    SizedBox(height: 8,),
                    Text("Landscape From Library", style: medium16(),),
                  ],
                ),
                SvgPicture.asset('./lib/assets/slider.svg',height: 54,width: 54,),
                ],
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
          //decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  tc.animateTo(0);
                },
                child: navbarIcon('./lib/assets/home_.svg', 'Home',tc.index==0),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  tc.animateTo(1);
                  //Navigator.of(context).push(route)
                },
                child: navbarIcon('./lib/assets/apps.svg', 'Apps',tc.index==1)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      tc.animateTo(2);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(offset: Offset(3, 5),blurRadius: 10, color: Colors.black12, spreadRadius: 5)],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 30,
                        child: SvgPicture.asset('./lib/assets/ai.svg',color:Colors.white),
                      ),
                    )
                  ),
                  
                  const SizedBox(height: 5,),
                  const Text('Ai',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.grey),),
                ],
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  tc.animateTo(3);
                },
                child: navbarIcon('./lib/assets/playlist.svg', 'Playlist',tc.index==3),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  tc.animateTo(4);
                },
                child: navbarIcon('./lib/assets/discovery.svg', 'Discover',tc.index==4),
              ),
             ],
          ),
        )
      ],
    )
  );
}

Widget navbarIcon(String itemicon,String itemname,bool selected){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(itemicon,color:selected?Colors.black:Colors.grey),
        const SizedBox(height: 5,),
        Text(itemname,style: TextStyle(fontSize: 10,fontWeight: selected?FontWeight.w500:FontWeight.w300,color: selected?Colors.black:Colors.grey),),
      ],
    )
  );
}