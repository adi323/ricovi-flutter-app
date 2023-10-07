import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/signupcontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  
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
              child: Image(image: const AssetImage('./lib/assets/signin.png'),height: MediaQuery.sizeOf(context).height-400,width: MediaQuery.sizeOf(context).width,fit:BoxFit.fill,)
            ),
            
             Align(
              alignment: Alignment.bottomCenter,
              
              child: AnimatedContainer(
                padding: const EdgeInsets.all(30),
                duration: const Duration(milliseconds: 500),
                height:  455,
                alignment: Alignment.center,
                width:  MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
                ),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cnt.getsignin()?'Already a user?':'New User?',style: medium14().copyWith(fontWeight: FontWeight.w300),),
                    const SizedBox(height: 10,),
                    Text(cnt.getsignin()?'SignIn':'SignUp',style: bold24(),),
                    const SizedBox(height: 20,),
                    Text('Email',style: medium16(),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller:cnt.email,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                        filled: true,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                        
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                        hintText: 'Your Email Address',
                      ),
                    ),
                    const SizedBox(height: 20,),
                    const Row(
                      children: [
                        Text('Password',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('Forgot Password?',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: cnt.password,
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16),
                      cursorColor: Colors.black,
                      obscuringCharacter: '*',
                      obscureText: true,
                       decoration: InputDecoration(
                        fillColor: const Color(0xFFD9D9D9).withOpacity(0.3),
                        filled: true,
                        
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                        hintText: 'Enter your password',
                        
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