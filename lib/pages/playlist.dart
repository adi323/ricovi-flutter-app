import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ricovi/controller/playlistcontroller.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/homepage/searchpage.dart';
import 'package:ricovi/pages/playlistpages/addimagetoplaylist.dart';
import 'package:ricovi/pages/playlistpages/createnewplaylistpage.dart';
import 'package:ricovi/pages/playlistpages/playlistdetail.dart';
import 'package:svg_flutter/svg.dart';

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _PlaylistsState();
}

class _PlaylistsState extends State<Playlists> {

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
        child: GetBuilder<playlistController>(
          init: Get.put(playlistController()),
          builder:(cnt)=> 
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Text('Playlists',style: medium20(),textAlign: TextAlign.left,),
                  const Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){
                      Navigator.of(context).push(CustomRoute(child: const SearchPage(), time: const Duration(milliseconds: 500)));
                    },
                    child: SvgPicture.asset('./lib/assets/search.svg'),
                  ),
                  
                  //Icon(LineIco),
                ],
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  //shadowColor: Colors.white,
                  elevation: 0,
                  side: BorderSide(color: Colors.black.withOpacity(0.1)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                  Navigator.of(context).push(CustomRoute(child: const CreateNewPlaylistPage(),time:const Duration(milliseconds: 1200)));
                },
                
                child: Text('Create a new',style: medium16().copyWith(fontWeight: FontWeight.w500),)),
              
              
                
              for(var item in cnt.lst.keys) playlistItem(context,item,cnt.lst[item]??[])
              //...[cnt.lst.keys.forEach((element)=>playlistItem("My playlist 1"))]
              /*...playlistItem("My playlist 1"),
              ...playlistItem("My playlist 1"),
              ...playlistItem("My playlist 1"),*/
              
              
              
            ],
             
          )
        )
      ),
    );
  }

  playlistItem(BuildContext context,String title,List<String> itemdata){
    return itemdata.isEmpty?
    
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25,),
        Text(title,style: medium16().copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
        const SizedBox(height: 25,),
        GestureDetector(
          onTap: (){
            //print("hello");
            Navigator.of(context).push(CustomRoute(child: AddImagetoPL(text: title,),time:const Duration(milliseconds: 1200)));
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            height: 180,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add),
                ),
                const SizedBox(height: 20,),
                Text('No Media Found',style: medium16().copyWith(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.1)),textAlign: TextAlign.left,),
              ],
            )
          )
        ),
      ],
    )
    :
    Column(
      children: [
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Text(title.capitalize.toString(),style: medium16().copyWith(fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(CustomRoute(child: PlayListDetail(imagelist: itemdata,title: title,),time:const Duration(milliseconds: 500)));
              },
              child: Text("See more",style: medium16().copyWith(decoration: TextDecoration.underline,decorationColor: Colors.black),textAlign: TextAlign.left,),
            ),
            
          ],
        ),
        const SizedBox(height: 20,),
        Container(
          height: 165,
          decoration: const BoxDecoration(color: Colors.white),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              //String key=categories.keys.elementAt(index).toString();
              return Container(
                margin: index==0?const EdgeInsets.fromLTRB(0,8,8,8):const EdgeInsets.all(8),
                child: Container(
                  height: 173,
                  width: 170,
                  decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8),image:DecorationImage(image: NetworkImage(itemdata[index].toString()),fit: BoxFit.fill) ),
                ),
              );
            },
            itemCount: itemdata.length,),
         ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              behavior:HitTestBehavior.opaque,
              onTap: (){
                showDialog(context: context, builder: (cnt)=> Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           //write children here
                           Text("Warning",style: medium16().copyWith(fontWeight: FontWeight.bold),),
                          const SizedBox(height:40),
                          Text("Do you want to delete this playlist?",style: medium16().copyWith(fontWeight: FontWeight.normal,color: const Color(0xFF827575)),textAlign: TextAlign.center,),
                          const SizedBox(height:40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shadowColor: Colors.transparent,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  minimumSize: const Size(110,50),
                                ),
                                onPressed: (){
                                    //Navigator.of(context).pop();
                                    var cnt=Get.find<playlistController>();
                                    cnt.lst.remove(title);
                                    cnt.update();
                                    Navigator.of(context).pop();
                                    //cnt.addnewPlaylist(ct.text);
                                    //Navigator.of(context).pushReplacement(CustomRoute(child: AddImagetoPL(text: ct.text,),time:Duration(milliseconds: 1200)));
                                },
                                
                                child: const Text('Delete',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shadowColor: Colors.transparent,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  minimumSize: const Size(110,50),
                                  side: BorderSide(color: Colors.black.withOpacity(0.1)),
                                ),
                                onPressed: (){
                                    Navigator.of(context).pop();
                                    //var cnt=Get.find<playlistController>();

                                    //cnt.addnewPlaylist(ct.text);
                                    //Navigator.of(context).pushReplacement(CustomRoute(child: AddImagetoPL(text: ct.text,),time:Duration(milliseconds: 1200)));
                                },
                                
                                child: const Text('Close',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)),
                            ],
                          )

                        ],
                      ),
                    )
                  ));
              },
              child: const SizedBox(height: 50,width: 50,child: Icon(LineIcons.alternateTrash,size: 23,),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black87,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                //minimumSize: const Size.fromHeight(55),
                minimumSize: Size(MediaQuery.sizeOf(context).width-120, 50)
              ),
              onPressed: (){
                  //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?navHomepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                  showDialog(context: context, builder: (cnt)=> Dialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: 450,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Done",style: medium16().copyWith(fontWeight: FontWeight.bold),),
                          const SizedBox(height:40),
                          Text("Your media is now on AI Frame",style: medium16().copyWith(fontWeight: FontWeight.normal,color: const Color(0xFF827575)),textAlign: TextAlign.center),
                          const SizedBox(height:40),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shadowColor: Colors.black87,
                              elevation: 15,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              minimumSize: const Size.fromHeight(50),
                              
                            ),
                            onPressed: (){
                                Navigator.of(context).pop();
                                //var cnt=Get.find<playlistController>();

                                //cnt.addnewPlaylist(ct.text);
                                //Navigator.of(context).pushReplacement(CustomRoute(child: AddImagetoPL(text: ct.text,),time:Duration(milliseconds: 1200)));
                            },
                            
                            child: const Text('Close',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                        ],
                      ),
                    )
                  ));
              },
              
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                
                
                Text('Push to AI Frame',style: medium14().copyWith(color: Colors.white)),
                const SizedBox(width: 10,),
                const Icon(Icons.send,size: 20,),
              ],),)
          ],
        ),
        const SizedBox(height: 25,),
      ]
    );
  }

}