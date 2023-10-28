import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ricovi/controller/playlistcontroller.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/aipages/loadingaipage.dart';

class AiImageResult extends StatefulWidget {
  AiImageResult({super.key,required this.text});
  String text;

  @override
  State<AiImageResult> createState() => _AiImageResultState();
}

class _AiImageResultState extends State<AiImageResult> {


  

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text("Done!",style: medium20(),),
            SizedBox(height: 20,),
            Text(widget.text,maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 20,),
            ClipRRect(
              child: Image.asset('./lib/assets/aiimage1.png',width: 360,height: 380,fit: BoxFit.fill,),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('./lib/assets/aiimage1.png',width: MediaQuery.sizeOf(context).width*0.26,height: MediaQuery.sizeOf(context).width*0.26,fit: BoxFit.fill,),
                ),
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('./lib/assets/aiimage2.png',width: MediaQuery.sizeOf(context).width*0.26,height: MediaQuery.sizeOf(context).width*0.26,fit: BoxFit.fill,),
                ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('./lib/assets/aiimage3.png',width: MediaQuery.sizeOf(context).width*0.26,height: MediaQuery.sizeOf(context).width*0.26,fit: BoxFit.fill,),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shadowColor: Colors.transparent,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: Size(MediaQuery.sizeOf(context).width*0.40,60),
                    side: BorderSide(color: Colors.black.withOpacity(0.1)),
                  ),
                  onPressed: (){
                    Navigator.of(context).pushReplacement(CustomRoute(child: LoadingAiPage(text: widget.text,),time:Duration(milliseconds: 1200)));
                  },
                  
                  child: const Text('Regenerate',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.transparent,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: Size(MediaQuery.sizeOf(context).width*0.40,60),
                    
                  ),
                  onPressed: (){
                    /*var v=Get.put(playlistController());

                    v.updatePlaylist("Ai art", ['./lib/assets/aiimage1.png','./lib/assets/aiimage2.png','./lib/assets/aiimage3.png','./lib/assets/aiimage4.png']);*/
                    Navigator.pop(context);
                  },
                  
                  child: const Text('Add to Playlist',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)),
              ],
            )
          ],
        )
      ),
    );
  }
}