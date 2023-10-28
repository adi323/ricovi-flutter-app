import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ricovi/controller/signupcontroller.dart';
import 'package:svg_flutter/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key,required this.token});
  String token;
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController text1=TextEditingController();
  TextEditingController text2=TextEditingController();
  GlobalKey<FormState> _form1=new GlobalKey<FormState>();
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
      body: GetBuilder(
        init: Get.find<SignupController>(),
        builder:(cnt)=> Form(
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
                  child: const Text('Set a new password',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
                ),
                const SizedBox(height: 30,),
                const Text('Password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
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
                    hintText: 'Enter your new password',
                  ),
                ),
                const SizedBox(height: 40,),
                const Text('Confirm your password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
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
                     if(text1.text==text2.text)
                      cnt.changepassword(context,text1.text,widget.token);
                  },
                  
                  child: const Text('Save',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
              ],
            )
          )
        )
      ),
    );
  }
}