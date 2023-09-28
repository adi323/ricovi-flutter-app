import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ricovi/helpers/customroute.dart';
import 'package:ricovi/pages/homepage/notifypage.dart';
import 'package:ricovi/pages/homepage/searchpage.dart';
import 'package:ricovi/pages/homepage/settingspage.dart';
import 'package:svg_flutter/svg_flutter.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {

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
  final iconList = <IconData>[
    LineIcons.home,
    LineIcons.appStore,
    LineIcons.apperSystemsAb,
    LineIcons.accusoft
  ];
  List<String> headings=["From our library","New from artist you like","Your playlists"];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const Text('My Frame',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.of(context).push(CustomRoute(child: SearchPage(), time: Duration(milliseconds: 500)));
                  },
                  child: SvgPicture.asset('./lib/assets/search.svg'),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: (cont) => Container(
                        padding: EdgeInsets.all(32),
                        decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                        
                        width: MediaQuery.sizeOf(context).width,
                        height: 330,
                        child: Column(
                          children: [
                            const Text('Add',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
                            const SizedBox(height:48),
                            addmodsheet('./lib/assets/playlist.svg', 'Playlist', 'Add artwork to new playlist'),
                            const SizedBox(height:35),
                            addmodsheet('./lib/assets/adddevice.svg', 'Device', 'Add a new device'),
                            const SizedBox(height:30),
                          ],
                        ),
                      ));
                  
                  },
                  child: SvgPicture.asset('./lib/assets/add.svg'),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.of(context).push(CustomRoute(child: NotficationsPage(), time: Duration(milliseconds: 500)));
                  },
                  child: SvgPicture.asset('./lib/assets/ntify.svg'),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    Navigator.of(context).push(CustomRoute(child: SettingsPage(), time: Duration(milliseconds: 500)));
                  },
                  child: SvgPicture.asset('./lib/assets/settings.svg'),
                ),
                //Icon(LineIco),
              ],
            ),

            const SizedBox(height: 35,),
            ...homeitem(headings[0]),
            ...homeitem(headings[1]),
            ...homeitem(headings[2]),
            
            
            
          ],
           
        )
      ),
    );
  }

  List<Widget> homeitem(String title){
    return [
      Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
      const SizedBox(height: 20,),
      Container(
        height: 165,
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            String key=categories.keys.elementAt(index).toString();
            return Container(
              margin: index==0?const EdgeInsets.fromLTRB(0,8,8,8):const EdgeInsets.all(8),
              child: Column(
                                  
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 173,
                    decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(8),image:DecorationImage(image: NetworkImage(categories[key].toString()),fit: BoxFit.fill) ),
                  ),
                  const SizedBox(height: 10,),
                  Text(key,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,))
                ],
              )
            );
          },
          itemCount: 5,),
      ),
      const SizedBox(height: 25,),
    ];
  }


  Widget addmodsheet(String itemicon,String itemname,String itemtagline){
    return Row(
      children: [
        SvgPicture.asset(itemicon,width: 54,height: 54,),
        const SizedBox(width: 16.5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(itemname,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
            

            Text(itemtagline,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey),textAlign: TextAlign.left,),
          ],
        )
      ],
    );
  }


}

