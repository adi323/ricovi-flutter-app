
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/notificationitem.dart';
//import 'package:ricovi/models/Notification.dart';

class playlistController extends GetxController{
  RxBool turnedOn=true.obs;
  List<String> categories=[
    "https://images.pexels.com/photos/6026442/pexels-photo-6026442.jpeg", 
    "https://images.pexels.com/photos/18126198/pexels-photo-18126198/free-photo-of-woman-with-white-dog.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", 
    "https://images.pexels.com/photos/16776159/pexels-photo-16776159/free-photo-of-water-around-rocks-on-shore.jpeg?auto=compress&cs=tinysrgb&w=1600", 
    "https://images.pexels.com/photos/2693212/pexels-photo-2693212.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", 
    "https://images.pexels.com/photos/2335126/pexels-photo-2335126.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", 
    "https://images.pexels.com/photos/1563256/pexels-photo-1563256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", 
    "https://images.pexels.com/photos/1078981/pexels-photo-1078981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", 
    "https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"];
  RxMap<String,List<String>> lst=<String,List<String>>{}.obs;
  

  


  @override
  void onInit() {
    super.onInit();
    lst.addAll({"My Playlist 1":categories,"Push to frame":categories});
  }

  
  addnewPlaylist(String t){
    lst.addAll({t:[]});
    update();
  }


  removeListitem(String key,List<String> items){

    lst[key]=List.from(lst[key]!.where((element) => !items.contains(element)));
    update();
  }

  updatePlaylist(String key,List<String> t){
    if(lst.keys.contains(key))
      lst[key]?.addAll(t);
    else{
      lst[key]=t;
    }
    update();
  }

}