import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/photoservices.dart';
import 'package:ricovi/controller/playlistcontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';

class GooglePhotosInt extends StatefulWidget {
  GooglePhotosInt({super.key,required this.title});

  String title;

  @override
  State<GooglePhotosInt> createState() => _GooglePhotosIntState();
}

class _GooglePhotosIntState extends State<GooglePhotosInt> {
  bool loading=false;
  List<String> photUrls=[];
  List<String> selectedUrls=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_photos();
  }


  fetch_photos()async{
    setState(() {
      loading=true;
    });
    final photoService=GooglePhotoService();
    final photos=await photoService.fetchGooglePhotos();
    ///print(photos);
    setState(() {
      photUrls=photos;
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [


          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: loading?
              const Center(
                child: SizedBox(
                  width: 50,
                  child: LinearProgressIndicator()
                )
              )
              :
              
              photUrls.isNotEmpty?MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              physics: ClampingScrollPhysics(),
              itemCount: photUrls.length,
              crossAxisSpacing: 8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                
                return GestureDetector(
                  onTap: (){
                    if(selectedUrls.contains(photUrls[index])){
                      selectedUrls.remove(photUrls[index]);
                    }
                    else{
                      selectedUrls.add(photUrls[index]);
                    }
                    setState(() {
                      
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(image: NetworkImage(photUrls[index]),fit: BoxFit.fill,)
                        ),
                         Positioned(
                          top: 0,
                          right: 0,
                          child:selectedUrls.contains(photUrls[index])?
                            Checkbox(value: selectedUrls.contains(photUrls[index]),activeColor: Colors.white.withOpacity(0.8),checkColor: Colors.black,onChanged: (value){},shape: CircleBorder(),)
                            :SizedBox()
                        ),
                        
                      ],
                    ),
                  )
                );
              },
              )
              :
               Center(child: Text("${photUrls.length}"),)
          ),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: (){
                  //Navigator.of(context).pushAndRemoveUntil(CustomRoute(child: WalkthroughPage1(),time:Duration(milliseconds: 1200)),(Route<dynamic> route) => false);
                  //print(selectedUrls);
                  var v=Get.find<playlistController>();
                  v.updatePlaylist(widget.title,selectedUrls);
              },
              
              child: const Text('Select',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ),
          

        ],


      )
            
          
    );
  }
}