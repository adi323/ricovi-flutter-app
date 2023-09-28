import 'package:flutter/material.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/navhome.dart';
import 'package:ricovi/pages/signin/otpscreen.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool _signin=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          AnimatedOpacity(
            opacity: _signin ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 1000),
            child: Image(image: const AssetImage('./lib/assets/signup.png'),width: MediaQuery.sizeOf(context).height*0.48,fit: BoxFit.fitWidth,)
          ),
          AnimatedOpacity(
            opacity: _signin ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 1000),
            child: Image(image: const AssetImage('./lib/assets/signin.png'),height: MediaQuery.sizeOf(context).height*0.55,width: MediaQuery.sizeOf(context).width,fit:BoxFit.fitWidth,)
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
                  Text(_signin?'Already a user?':'New User?',style: medium14().copyWith(fontWeight: FontWeight.w300),),
                  const SizedBox(height: 10,),
                  Text(_signin?'SignIn':'SignUp',style: bold24(),),
                  const SizedBox(height: 20,),
                  Text('Email',style: medium16(),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
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
                    style: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
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
                        Navigator.of(context).pushReplacement(CustomRoute(child: _signin?navHomepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                    },
                    
                    child: Text(_signin?'Login':'Continue',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                  const SizedBox(height: 20,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _signin=!_signin;
                        });
                      },
                      child: Text(_signin?'Need an account':'Already a user',textAlign: TextAlign.center,style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500)
                    ),),
                  ),
                ],
              ),
            )
          )
        ],
      ),

    );
  }
}