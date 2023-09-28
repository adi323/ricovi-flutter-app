import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ricovi/controller/settingscontroller.dart';
import 'package:ricovi/helpers/textstyles.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<settingscontroller>(
      init: Get.find<settingscontroller>(),
      builder: (cnt)=>Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
          title: Text('',style: bold24(),textAlign: TextAlign.center,),
          systemOverlayStyle: SystemUiOverlayStyle.dark
        ),
        backgroundColor: Colors.white,
        body:ListView(
          padding: const EdgeInsets.fromLTRB(30, 25, 30, 25),
          
          children: [
            Text('My Account',style: bold24(),textAlign: TextAlign.left,),
            SizedBox(height: 50,),
            
            CircleAvatar(radius: 80,backgroundImage: NetworkImage('https://images.pexels.com/photos/2395251/pexels-photo-2395251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),),

            SizedBox(height: 20,),
            Text('Change Profile Picture',style: medium16().copyWith(color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            SizedBox(height: 70,),

            Text('Name',style: medium14().copyWith(color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            SizedBox(height: 10,),
            Text('Minhaz Majumder',style: medium16().copyWith(color: Colors.black45,),textAlign: TextAlign.left,),
            
            SizedBox(height: 30,),

            Text('Change Email Address',style: medium14().copyWith(color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            SizedBox(height: 10,),
            Text('adityanandi5589@gmail.com',style: medium16().copyWith(color: Colors.black45,),textAlign: TextAlign.left,),
            

            SizedBox(height: 30,),
            Row(
              children: [
                Text('Change Password',style: medium14().copyWith(color: Colors.black,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded)
              ],
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shadowColor: Colors.black87,
                    elevation: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    minimumSize: const Size.fromHeight(60),
                  ),
                  onPressed: (){
                    //cnt.changedevicevalue(txt.toString());
                    Navigator.of(context).pop();
                      //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?Homepage():OtpScreen(),time:Duration(milliseconds: 1200)));
                  },
                  
                  child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),

          ]
        )
      )
    );
  }

  

}

