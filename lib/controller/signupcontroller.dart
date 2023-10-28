import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/models/otpverify.dart';
import 'package:ricovi/models/respModel.dart';
import 'package:ricovi/networking/apiclient.dart';
import 'package:ricovi/helpers/sharedPrefs.dart';
import 'package:ricovi/models/Loginstatus.dart';
import 'package:ricovi/pages/navhome.dart';
import 'package:ricovi/pages/signin/forgotpassword.dart';
import 'package:ricovi/pages/signin/otpscreen.dart';
import 'package:ricovi/pages/signin/signinpages.dart';
import 'package:ricovi/pages/signin/signupdetailspage.dart';
import 'package:ricovi/pages/signin/turnonnotify.dart';



class SignupController extends GetxController{
  TextEditingController email=new TextEditingController();
  TextEditingController password=new TextEditingController();
  TextEditingController name=new TextEditingController();
  TextEditingController phone=new TextEditingController();

  String emailfield="",passwordfield="";
  int otp=0;
  late String token;
  final RxBool _signin=true.obs;
  
  var client=ApiClient();
  

  signup()async{
    
    ResponseModel res=await client.signup(email: emailfield, password: passwordfield);
    if(!res.hasError){
      await authSave().signupUser(emailfield);
      return true;
    }
    

    return false;
    
  }

  callforgotpasswordapi(BuildContext context)async{

    ResponseModel res=await client.forgotpassword(email: email.text);
    if(!res.hasError){
      Navigator.of(context).push(CustomRoute(child: OtpScreen(forgot: true,email: email.text,),time:const Duration(milliseconds: 1200)));
      
    }
    

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Incorrect Email/Password attempt"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
    );
  }


  getsignin(){
    return _signin.value;
  }

  updatesignin(){
    _signin.value=!_signin.value;
    update();
  }

  login()async{

    ResponseModel res=await client.login(email: emailfield, password: passwordfield);
    print(res.data);
    if(!res.hasError){
      var result=LoginStatus.fromJson(jsonDecode(res.data.toString()) as Map<String,dynamic>);
      if(!(result.isError!)){
        await authSave().loginUser(result);
        return 1;
      }else{
        return 2;
      }
      
    }
    return 0;
     
  }

  resendotp(bool k)async{


    ResponseModel res=await client.resendOTP(email: email.text,mode:k?'forgotpassword':'verify');
    print(res.data);
    if(!res.hasError){
      
      return true;
    }
    

    return false;
    
  }

  


  signupbuttonpressed(context)async{
    emailfield=email.text;
    passwordfield=password.text;
    
    
    
    
    
    if(_signin.value){
      int p=(await login())??0;
      if(p!=0) {
        Navigator.of(context).push(CustomRoute(child: p==1?const navHomepage():OtpScreen(email: email.text,forgot: false,),time:const Duration(milliseconds: 1200)));
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect Email/Password attempt"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
        );
      }
    }else{
      //signup();
      bool p=(await signup())?? false;
      
      if(p) {
        Navigator.of(context).push(CustomRoute(child: OtpScreen(forgot: false,email: emailfield,),time:const Duration(milliseconds: 1200)));
      } else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email already registered"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
        );
      }
    }
    
  }

  verify(BuildContext context,int otp,Timer _timer,bool k)async{
    

    ResponseModel res=await client.otpVerify(email: email.text, OTP: otp,mode: k?'forgotpassword':'verify');
    print(res.data);
    if(!res.hasError){
      
      if(!k){
        var result=LoginStatus.fromJson(jsonDecode(res.data.toString()) as Map<String,dynamic>);
        await authSave().loginUser(result);
        Navigator.of(context).push(CustomRoute(child: SignupDetailsPage(),time:const Duration(milliseconds: 1200)));
      }
      else{
        var result=otpverify.fromJson(jsonDecode(res.data.toString()) as Map<String,dynamic>);
        Navigator.of(context).push(CustomRoute(child: ForgotPasswordScreen(token: result.data!.token ??''),time:const Duration(milliseconds: 1200)));
        //await authSave().(result);
      }
      
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("wrong OTP"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
    );

  }


  changepassword(BuildContext context,String password,String token)async{
    
    ResponseModel res=await client.resetpassword(token: token,password: password);
    print(res.data);
    if(!res.hasError){
       Navigator.of(context).pushAndRemoveUntil(CustomRoute(child: SigninPage(),time:const Duration(milliseconds: 500)), (Route<dynamic> route) => false);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Does not match"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
    );
  }

  updateme(BuildContext context,String countryCode)async{

    String token=await authSave().gettoken();
    ResponseModel res=await client.updateUser(phone: int.parse(phone.text),name: name.text,countryCode: countryCode,token: token);
    print(res.data);
    if(!res.hasError){
      authSave().updatename(name.text, phone.text);
       Navigator.of(context).push(CustomRoute(child: TurnonNotify(),time:const Duration(milliseconds: 1200)));
    }

  }

}