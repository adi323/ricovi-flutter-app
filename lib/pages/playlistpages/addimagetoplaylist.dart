import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/playlistpages/dropbox.dart';
import 'package:ricovi/pages/playlistpages/googlephotos.dart';
import 'package:ricovi/pages/playlistpages/openseas.dart';
import 'package:ricovi/pages/playlistpages/upload.dart';
import 'package:svg_flutter/svg_flutter.dart';

class AddImagetoPL extends StatefulWidget {
  AddImagetoPL({super.key,required this.text});

  String text;

  @override
  State<AddImagetoPL> createState() => _AddImagetoPLState();
}

class _AddImagetoPLState extends State<AddImagetoPL> with TickerProviderStateMixin{


  late TabController tc2;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc2=TabController(length: 4, vsync: this);

    tc2.addListener(() { 
      setState(() {
      });
      print("Selected IndexPLADI: " + tc2.index.toString());
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
            Navigator.of(context).pop();
            //widget.tc.animateTo(0,curve: Curves.easeInOut);
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
            height: 220,
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.text.capitalize.toString(),style: bold24().copyWith(fontWeight: FontWeight.w500,fontSize: 20),),
                const SizedBox(height:10),
                Text('You can keep adding  media from multiple source at once',style: medium14().copyWith(color: Colors.black45),),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(0);

                      },
                      child: TabbarWidget('./lib/assets/icons/pluspl.svg', "Upload",tc2.index==0),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(1);
                        
                      },
                      child: TabbarWidget('./lib/assets/icons/gphotos.svg', "Photos",tc2.index==1),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(2);
                      },
                      child: TabbarWidget('./lib/assets/icons/dropbox.svg', "Dropbox",tc2.index==2),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        tc2.animateTo(3);
                      },
                      child: TabbarWidget('./lib/assets/icons/openseas.svg', "OpenSea",tc2.index==3)
                    )
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tc2,
              children:[
                UploadImage(),
                GooglePhotosInt(title: widget.text,),
                DropBoxInt(),
                OpenSeasInt()
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
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: active?[BoxShadow(blurRadius: 50, spreadRadius: 0,color: Colors.black.withOpacity(0.05),offset: Offset(0, 4))]:[],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color:!active?Colors.black45.withOpacity(0.1): Colors.black.withOpacity(0.5),width: 1.5),
          ),
          child: SvgPicture.asset(assetname,height: 25,width: 25,fit: BoxFit.scaleDown,),
        ),
        const SizedBox(height: 10,),
        Text(txt,style: medium12().copyWith(color: !active?Colors.black45.withOpacity(0.2):Colors.black),)
      ],
    );
  }
}