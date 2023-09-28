
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/notificationitem.dart';
//import 'package:ricovi/models/Notification.dart';

class notifcontroller extends GetxController{
  RxBool turnedOn=true.obs;
  RxList<Widget> lst=<Widget>[].obs;
  RxList<Widget> lst2=<Widget>[].obs;

  


  @override
  void onInit() {
    super.onInit();
    lst.add(NotificationItem('https://images.pexels.com/photos/2395251/pexels-photo-2395251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','Artist David Elson uploaded a new\nalbum', DateTime.now().subtract(Duration(minutes:5))));
    for (var i = 0; i < 5; i++) {
      lst2.add(NotificationItem('https://images.pexels.com/photos/2395251/pexels-photo-2395251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1','Artist David Elson uploaded a new\npicture',DateTime.now().subtract(Duration(hours: 11))));
    }
  }

  changentifypref(bool p){
    turnedOn.value=p;
    update();
  }

}