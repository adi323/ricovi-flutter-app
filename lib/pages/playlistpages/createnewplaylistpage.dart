import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/playlistcontroller.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/playlistpages/addimagetoplaylist.dart';
import 'package:svg_flutter/svg.dart';

class CreateNewPlaylistPage extends StatefulWidget {
  const CreateNewPlaylistPage({super.key});

  @override
  State<CreateNewPlaylistPage> createState() => _CreateNewPlaylistPageState();
}

class _CreateNewPlaylistPageState extends State<CreateNewPlaylistPage> {

  TextEditingController ct=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,allowDrawingOutsideViewBox: false,width:MediaQuery.sizeOf(context).width*0.4,),
                ),
              ],
            ),
            const SizedBox(height: 80,),
            const Text('Enter a name for your playlist',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
            const SizedBox(height: 20,),
            const Text('Name the playlist',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                filled: true,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                hintText: 'Enter playlist name',
              ),
              controller: ct,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black87,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onLongPress: (){
                print(ct.text);
              },
              onPressed: (){
                  //Navigator.of(context).pop();
                  var cnt=Get.find<playlistController>();

                  cnt.addnewPlaylist(ct.text);
                  Navigator.of(context).pushReplacement(CustomRoute(child: AddImagetoPL(text: ct.text,),time:Duration(milliseconds: 1200)));
              },
              
              child: const Text('Create',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
      ),
    );
  }
}