import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ricovi/helpers/textstyles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  TextEditingController txt=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),onPressed: (){Navigator.of(context).pop();},),
          title: Text('',style: bold24(),textAlign: TextAlign.center,),
          systemOverlayStyle: SystemUiOverlayStyle.dark
        ),
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(30),
          children: [
            Text('Search',style: bold24(),textAlign: TextAlign.left,),
            SizedBox(height: 20,),
            TextFormField(
              controller: txt,
              
              decoration: InputDecoration(
                  isDense: true,
                  fillColor: const Color(0xFFD9D9D9).withOpacity(0.2),
                  filled: true,
                  //focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.black)),
                  suffixIconColor: Colors.black,
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(LineIcons.search,color: Colors.black,size: 24,)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.2),fontWeight: FontWeight.w400,fontSize: 16),
                  hintText: 'Search your favorite Art, Artist or Playlists',
                ),
            )
          ],
        ),
    );
  }
}