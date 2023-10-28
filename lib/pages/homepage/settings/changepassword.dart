import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/signupcontroller.dart';
import 'package:ricovi/helpers/sharedPrefs.dart';
import 'package:ricovi/models/respModel.dart';
import 'package:ricovi/networking/apiclient.dart';
import 'package:svg_flutter/svg.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController text1=TextEditingController();
  TextEditingController text2=TextEditingController();
  GlobalKey<FormState> _form1=new GlobalKey<FormState>();

  changePassword(BuildContext context)async{
    ApiClient client=ApiClient();
    String token=await authSave().gettoken();
    ResponseModel res=await client.changePassword(currPassword: text1.text, newPassword: text2.text, token: token);
    
    
    
    print(res.data);
    if(!res.hasError){

      Navigator.of(context).pop();
      
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password did not change")));
      //Navigator.of(context).pop();
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _form1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Center(
                child: Container(
                  width: MediaQuery.sizeOf(context).width*0.4,
                  child: SvgPicture.asset('./lib/assets/logoonly.svg',color: Colors.black,)
                )
              ),
              const SizedBox(height: 20,),
              const Center(
                child: Text('Set a new password',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
              ),
              const SizedBox(height: 30,),
              const Text('Current Password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: text1,
                validator: (value) {
                  RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value==null || value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'This password is not supported';
                    } else {
                      return null;
                    }
                  }
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                  filled: true,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                  hintText: 'Enter your current password',
                ),
              ),
              const SizedBox(height: 40,),
              const Text('New password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
              TextFormField(
                controller:text2,
                validator: (value) {
                  RegExp regex =
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value==null || value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'This password is not supported';
                    } else {
                      return null;
                    }
                  }
                },
                decoration: InputDecoration(
                  fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                  
                  
                  filled: true,
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                  hintText: 'Enter your new password',
                ),
              ),
              MediaQuery.of(context).viewInsets.bottom==0?Spacer():SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shadowColor: Colors.black87,
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  minimumSize: const Size.fromHeight(60),
                ),
                onPressed: (){
                    // cnt.updateme(context);
                    if(_form1.currentState!.validate())
                      changePassword(context);
                },
                
                child: const Text('Change Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
            ],
          )
        )
      )
    );
  }
}