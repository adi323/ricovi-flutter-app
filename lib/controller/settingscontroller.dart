import 'package:get/get.dart';

class settingscontroller extends GetxController
{
  RxString deviceValue="My Smart Frame".obs;
  RxString frame="Landscape".obs;
  RxString imagetrans="Fade".obs;
  RxString imginterval="10 mins".obs;
  RxString wifiname="Monoxide-5G".obs;

  @override
  void onInit() {
    super.onInit();
  }

  changedevicevalue(String s){
    deviceValue.value=s;
    update();
  }

  changeframe(String s){
    frame.value=s;
    update();
  }

  changeimagetrans(String s){
    imagetrans.value=s;
    update();
  }

  changeimginterval(String s){
    imginterval.value=s;
    update();
  }

  changewifi(String s){
    wifiname.value=s;
    update();
  }
  
}