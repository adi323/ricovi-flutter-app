import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/setuppages/setupdevice.dart';

class ChooseFrame extends StatefulWidget {
  const ChooseFrame({super.key});

  @override
  State<ChooseFrame> createState() => _ChooseFrameState();
}

class _ChooseFrameState extends State<ChooseFrame> {

  int current=-1;
  Map<String,String> categories={
    "Ai Frame : Ai Frame":'./lib/assets/aiframe.png',
    "Nova S Series : Smart Mirror":'./lib/assets/smartmirror.png',
    "Nova Z Series : Smart Mirror":'./lib/assets/novazseries.png',

  };

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
      body: Stack(
        children: [
          const Positioned(
            child: Image(image: AssetImage('./lib/assets/confetti.png')),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  const Text('Hey John\nWelcome onboard.  👋',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                  SizedBox(height: 15,),
                  
                  const Text('Select the device you want to add from\n the list below.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.left,),
                  SizedBox(height: 25,),
                  ListView.builder(
                    itemBuilder: (context,index){
                      
                      String key=categories.keys.elementAt(index);
                      List<String> pd=key.toString().split(' : ');

                      return GestureDetector(
                        onTap: (){
                          if(current==index){
                            Navigator.of(context).push(CustomRoute(child: SetupDevice(),time:Duration(milliseconds: 1200)));
                          }
                          setState(() {
                            current=index;
                          });
                          
                          //Navigator.of(context).push(CustomRoute(child: SetupWifi(),time:Duration(milliseconds: 1200)));
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width-50,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 26,vertical: 28),
                          height: 130,
                          decoration: BoxDecoration(border: Border.all(width: 3,color: current==index?Colors.black:Colors.transparent),borderRadius: BorderRadius.circular(15)),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            
                            children: [
                              Image(image: AssetImage(categories[key].toString()),filterQuality: FilterQuality.high,),
                              SizedBox(width: 24,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  
                                  Text(pd[0],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
                                  SizedBox(height: 5,),
                                  Text(pd[1],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black38),textAlign: TextAlign.center,),
                                  
                                ],
                              ),
                            ]
                          )
                        )
                      );
                    },
                    shrinkWrap: true,
                    itemCount: 3,
                  ),
                ],
              )
          ),
          
        ],
      )
    );
  }
}