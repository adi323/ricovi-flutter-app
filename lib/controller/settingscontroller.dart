import 'package:get/get.dart';
import 'package:ricovi/helpers/sharedPrefs.dart';

class settingscontroller extends GetxController
{
  RxString deviceValue="My Smart Frame".obs;
  RxString frame="Landscape".obs;
  RxString imagetrans="Fade".obs;
  RxString imginterval="10 mins".obs;
  RxString wifiname="Monoxide-5G".obs;
  String name="",email="";

  @override
  void onInit() {
    super.onInit();
    getsignedindata();
  }

  getsignedindata()async{
    name=await authSave().getname();
    email=await authSave().getemail();
    update();
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

  changeimginterval(double s){
    imginterval.value='${s.toInt()} mins';
    update();
  }

  changewifi(String s){
    wifiname.value=s;
    update();
  }
  
}