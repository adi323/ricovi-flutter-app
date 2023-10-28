import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ricovi/controller/playlistcontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:svg_flutter/svg.dart';

class PlayListDetail extends StatefulWidget {
  PlayListDetail({super.key,required this.imagelist,required this.title});

  String title;
  List<String> imagelist;

  @override
  State<PlayListDetail> createState() => _PlayListDetailState();
}

class _PlayListDetailState extends State<PlayListDetail> {
  
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
            Navigator.of(context).pop();
            //widget.tc.animateTo(0,curve: Curves.easeInOut);
          }, 
          icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 25,
        )),
      ),
      body:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Row(
                  children: [
                    Text(widget.title.capitalize.toString(),style: medium20(),),
                    Spacer(),
                    Icon(Icons.add,size: 25,),
                    SizedBox(width: 10,),
                    Icon(Icons.share_outlined,size: 20,)
                  ],
                )
              ),

              Container(
                height: 398,
                
                decoration: const BoxDecoration(color: Colors.white),
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    //String key=categories.keys.elementAt(index).toString();
                    var key=widget.imagelist[index];
                    return GestureDetector(
                        onTap: (){
                          if(selected.contains(key))
                              selected.remove(key);
                          else{
                            
                            selected.add(key);
                            
                          }
                          setState(() {
                            
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                      
                                padding: index==0?EdgeInsets.fromLTRB(30, 8, 8, 8):index==widget.imagelist.length-1?EdgeInsets.fromLTRB(8,8,30,8):EdgeInsets.all(8),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: NetworkImage(widget.imagelist[index]),fit: BoxFit.fitWidth)
                                ),
                              ),
                              
                              

                              Positioned(
                                top: 0,
                                right: 0,
                                child:selected.contains(key)?
                                  Checkbox(value: selected.contains(key),activeColor: Colors.white.withOpacity(0.8),checkColor: Colors.black,onChanged: (value){},shape: CircleBorder(),)
                                  :SizedBox()
                              ),
                              
                            ],
                          ),
                        )
                      );
                  },
                  itemCount: widget.imagelist.length,
                )
              ),
              
            ],
          ),

          Container(
            height: 260,
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("View As",style: medium14().copyWith(color: Colors.black38,),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    CustomSlidingSegmentedControl<int>(
                      height: 60,
                      innerPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                      children: {
                        0: SvgPicture.asset('./lib/assets/icons/potrait.svg',width: 24,height: 24,fit: BoxFit.scaleDown,),
                        1: SvgPicture.asset('./lib/assets/icons/grid.svg',width: 24,height: 24,fit: BoxFit.scaleDown,)
                      },
                      //splashColor: Colors.white.withOpacity(0.1),
                      decoration: BoxDecoration(
                        color: CupertinoColors.lightBackgroundGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      
                      //splashFactory: InkRipple.splashFactory,
                      fromMax: false,
                      isStretch: false,
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
                    Spacer(),
                    Text('${selected.length} item selected',style: medium14().copyWith(color: Colors.black38,),),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        print("hello");
                        /*var cnt=Get.find<playlistController>();
                        widget.imagelist=List.from(widget.imagelist.where((element) => !selected.contains(element)));
                        cnt.removeListitem(widget.title,widget.imagelist);
                        setState(() {
                          
                        });*///not working
                      },
                      child: const SizedBox(height: 50,width: 50,child: Icon(LineIcons.alternateTrash,size: 23,),),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black87,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                      //Navigator.of(context).push(CustomRoute(child: LoadingAiPage(),time:Duration(milliseconds: 1200)));
                  },
                  
                  child: Text('Save',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),

              ],
            ),
          )
        ]
      )
          

    );
  }
}