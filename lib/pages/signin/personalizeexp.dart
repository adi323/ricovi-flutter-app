import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/helpers/textstyles.dart';
import 'package:ricovi/pages/walkthrough/walkthrough_page1.dart';

class PersonalizeExperience extends StatefulWidget {
  const PersonalizeExperience({super.key});

  @override
  State<PersonalizeExperience> createState() => _PersonalizeExperienceState();
}

class _PersonalizeExperienceState extends State<PersonalizeExperience> {

  int count=0;
  Map<String,String> categories={
    "Wildlife":'https://images.pexels.com/photos/6026442/pexels-photo-6026442.jpeg',
    "Galaxy":'https://images.pexels.com/photos/6444367/pexels-photo-6444367.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    "Nature":'https://images.pexels.com/photos/16776159/pexels-photo-16776159/free-photo-of-water-around-rocks-on-shore.jpeg?auto=compress&cs=tinysrgb&w=1600',
    "Abstract":'https://images.pexels.com/photos/2693212/pexels-photo-2693212.png?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    "Mountain":'https://images.pexels.com/photos/2335126/pexels-photo-2335126.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    "City":'https://images.pexels.com/photos/1563256/pexels-photo-1563256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    "Beach":'https://images.pexels.com/photos/1078981/pexels-photo-1078981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    "Cars":'https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',

  };
  List<String> allcatsel=[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 25),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              primary: true,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              //primary: true,
              children: [
                const SizedBox(height: 20,),
                const Text('Personalize your experience',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600),),
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Tell us what you love. Select any 5\ncategories.',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w400),),
                    Spacer(),
                    Text('${allcatsel.length}/5',style: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w400),)
                  ],
                ),
                const SizedBox(height: 20,),
                MasonryGridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    physics: ClampingScrollPhysics(),
                    itemCount: categories.keys.length,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String key=categories.keys.elementAt(index);
                      return GestureDetector(
                        onTap: (){
                          if(allcatsel.length<5){
                            setState(() {
                              if(allcatsel.contains(key))
                                allcatsel.remove(key);
                              else{
                                allcatsel.add(key);
                              }
                            });
                          }
                        },
                        onDoubleTap: (){
                          print(allcatsel);
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(image: NetworkImage(categories[key]!),fit: BoxFit.fill,)
                              ),
                              
                              AnimatedContainer(
                                width: double.infinity,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceInOut,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    colors: allcatsel.contains(key)?[Colors.transparent,Colors.green.shade800]:[Colors.transparent,Colors.black54],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                  )),
                                padding: const EdgeInsets.all(10),
                                child: Text(key,textAlign: TextAlign.center,style: medium14().copyWith(color: Colors.white),)
                              ),
                              
                            ],
                          ),
                        )
                      );
                    },
                    ),
                    const SizedBox(height: 100,)
              ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shadowColor: Colors.black,
                elevation: 15,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                minimumSize: const Size.fromHeight(60),
              ),
              onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(CustomRoute(child: WalkthroughPage1(),time:Duration(milliseconds: 1200)),(Route<dynamic> route) => false);
              },
              
              child: const Text('Select',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
      ),
    );
  }
}


