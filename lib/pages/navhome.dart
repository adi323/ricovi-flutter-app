import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ricovi/helpers/bottomnavbar.dart';

import 'package:ricovi/pages/ai.dart';
import 'package:ricovi/pages/apppage.dart';
import 'package:ricovi/pages/discover.dart';
import 'package:ricovi/pages/homepage.dart';
import 'package:ricovi/pages/playlist.dart';

class navHomepage extends StatefulWidget {
  const navHomepage({super.key});

  @override
  State<navHomepage> createState() => _navHomepageState();
}

class _navHomepageState extends State<navHomepage> with TickerProviderStateMixin {

  
  late TabController tc;

  



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc=TabController(length: 5, vsync: this);

    tc.addListener(() { 
      setState(() {
      });
      print("Selected Index: " + tc.index.toString());
    });
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
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tc,
        
        children: [
          NewHomePage(),
          AppPage(tc: tc,),
          AiPage(),
          Playlists(),
          Discover()
        ],
      ),
      
      
      
      /**/
      
      bottomNavigationBar: bottomnavBar(tc),
    );
  }

}