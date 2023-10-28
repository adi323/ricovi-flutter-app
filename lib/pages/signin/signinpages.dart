import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/signupcontroller.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/signin/forgotpassword.dart';
import 'package:ricovi/pages/signin/otpscreen.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _form1Key = GlobalKey();
  final GlobalKey<FormState> _form2Key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(
        init: Get.put(SignupController()),
        builder:(cnt)=> Stack(
           children: [
            AnimatedOpacity(
              opacity: cnt.getsignin()? 0.0 : 1.0,
              duration: const Duration(milliseconds: 1000),
              child: Image(image: const AssetImage('./lib/assets/signup.png'),width: MediaQuery.sizeOf(context).width,height: MediaQuery.sizeOf(context).height-400,fit: BoxFit.fill,)
            ),
            AnimatedOpacity(
              opacity: cnt.getsignin() ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Image(image: const AssetImage('./lib/assets/signin.png'),height: MediaQuery.sizeOf(context).height-400,width: MediaQuery.sizeOf(context).width,fit:BoxFit.fitWidth,)
            ),
            
             Align(
              alignment: Alignment.bottomCenter,
              
              child: AnimatedContainer(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                duration: const Duration(milliseconds: 500),
                height: 480,
                alignment: Alignment.center,
                width:  MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
                ),
                 child: Column(
                  //shrinkWrap: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cnt.getsignin()?'Already a user?':'New User?',style: medium14().copyWith(fontWeight: FontWeight.w300),),
                    const SizedBox(height: 10,),
                    Text(cnt.getsignin()?'SignIn':'SignUp',style: bold24(),),
                    const SizedBox(height: 20,),
                    Text('Email',style: medium16(),),
                    const SizedBox(height: 10,),
                    Form(
                      key: _form1Key,
                      child: TextFormField(
                        controller:cnt.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (String? value){
                          const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                              r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                              r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                              r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                              r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                              r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                              r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                          final regex = RegExp(pattern);

                          return value!.isNotEmpty && !regex.hasMatch(value)
                              ? 'This email is not supported'
                              : null;
                        },
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                          filled: true,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                          hintText: 'Your Email Address',
                        ),
                      )
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Text('Password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
                        Spacer(),
                        Visibility(
                          visible: cnt.getsignin(),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              if(cnt.email.text.isNotEmpty && cnt.email.text.isEmail){
                                
                                cnt.callforgotpasswordapi(context);
                                //
                                //Navigator.of(context).push(CustomRoute(child: ForgotPasswordScreen(),time:const Duration(milliseconds: 1200)));
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Email Empty"),duration: Duration(milliseconds: 500),backgroundColor: Colors.redAccent,)
                                );
                              }
                              
                            },
                            child: Text('Forgot Password?',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Form(
                      key: _form2Key,
                      child: TextFormField(
                        controller: cnt.password,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                        cursorColor: Colors.black,
                        
                        obscuringCharacter: '*',
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
                        obscureText: true,
                         decoration: InputDecoration(
                          fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                          filled: true,
                          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.red)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                          hintText: 'Enter your password',
                          
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shadowColor: Colors.black87,
                        elevation: 15,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        minimumSize: const Size.fromHeight(60),
                      ),
                      onPressed: (){
                        if(_form1Key.currentState!.validate()&&_form2Key.currentState!.validate())
                          cnt.signupbuttonpressed(context);
                      },
                      
                      child: Text(cnt.getsignin()?'Login':'Continue',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 20,),
                    Center(
                      child: InkWell(
                        onTap: (){
                          
                          cnt.updatesignin();
                        },
                        child: Text(cnt.getsignin()?'Need an account':'Already a user',textAlign: TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)
                      ),),
                    ),
                  ],
                ),
              )
            )
          ],
        )
      ),

    );
  }
}