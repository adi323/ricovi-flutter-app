import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/sharedPrefs.dart';
import 'package:ricovi/models/Loginstatus.dart';
import 'package:ricovi/models/SignupStatus.dart';
import 'package:ricovi/pages/navhome.dart';
import 'package:ricovi/pages/signin/otpscreen.dart';
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
  final _connect = GetConnect();
  final String baseurl="http://ec2-13-126-91-30.ap-south-1.compute.amazonaws.com:8003/api";
  final headers = {"Accept": "application/json"};

  getsignin(){
    return _signin.value;
  }

  updatesignin(){
    _signin.value=!_signin.value;
    update();
  }

  login()async{
    var loginurl=baseurl+'/user/login';
    Map<String,String> body={
      "email":emailfield,
      "password":passwordfield
    };
    
    
    //'email=abcd@gmail.com&password=12345678';
    
    var res=await _connect.post(
      loginurl, 
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: headers

    );
    print(res.bodyString);
    if(res.statusCode==201){
      var result=LoginStatus.fromJson(jsonDecode(res.bodyString.toString()) as Map<String,dynamic>);
      await authSave().loginUser(result);
      return authSave().isloggedin();
    }

    return false;    
  }

  resendotp()async{
    var loginurl=baseurl+'/user/login';
    Map<String,String> body={
      "email":emailfield,
      "password":passwordfield
    };
    
    
    
    var res=await _connect.post(
      loginurl, 
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: headers

    );
    print(res.bodyString);
    if(res.statusCode==200){
      otp=jsonDecode(res.bodyString.toString())['data']['otp']['otp'];
    }
    update();
  }

  signup()async{
    var signupurl=baseurl+'/user/signup';
    Map<String,String> body={
      "email":emailfield,
      "password":passwordfield,
    };
    
    var res=await _connect.post(
      signupurl, 
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: headers

    );
    print(res.bodyString);
    if(res.statusCode==200){
      var result=SignupStatus.fromJson(jsonDecode(res.bodyString.toString()) as Map<String,dynamic>);
      otp=result.data!.otp!.otp!;
      await authSave().signupUser(result);
      return true;
    }

    return false;
    
  }


  signupbuttonpressed(context)async{
    emailfield=email.text;
    passwordfield=password.text;
    //print(emailfield);
    if(emailfield.isEmpty || passwordfield.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email/Pasword Empty"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
      );
      //return ;
    }
    
    if(_signin.value){
      bool p=await login();
      if(p)
        Navigator.of(context).push(CustomRoute(child: const navHomepage(),time:const Duration(milliseconds: 1200)));

      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Incorrect Email/Password attempt"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
        );
      }
    }else{
      //signup();
      bool p=await signup();
      print(p);
      if(p)
        Navigator.of(context).push(CustomRoute(child: const OtpScreen(),time:const Duration(milliseconds: 1200)));
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error Occured"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
        );
      }
    }
    
  }

  verify(BuildContext context,String p,Timer _timer)async{
    var signupurl=baseurl+'/user/otp-verify';
    Map<String,String> body={
      "email":emailfield,
      "mode":"verify",
      "otp":p
    };
    
    var res=await _connect.post(
      signupurl, 
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: headers

    );
    print(res.bodyString);
    if(res.statusCode==201){
      _timer.cancel();
      token=jsonDecode(res.bodyString.toString())['data']['token'];
      authSave().savetoken(token);
      Navigator.of(context).push(CustomRoute(child: SignupDetailsPage(),time:Duration(milliseconds: 1200)));
    }
  }


  updateme(BuildContext context)async{
    var signupurl=baseurl+'/user';
    Map<String,String> body={
      "name":name.text,
      "phone":phone.text,
      "countryCode":"+1"
      
    };
    print(body);
    var res=await _connect.put(
      signupurl, 
      body,
      contentType: 'application/x-www-form-urlencoded',
      headers: {"Accept": "application/json","Authorization":'Bearer ${token}'}

    );
    print(res.bodyString);
    if(res.statusCode==201){
      
      authSave().updatename(name.text, phone.text);
      Navigator.of(context).push(CustomRoute(child: TurnonNotify(),time:Duration(milliseconds: 1200)));
    }


    

  }

}