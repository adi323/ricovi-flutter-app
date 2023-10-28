import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {


  Map<String,bool> allvals={
    "ABC News":false,
    "Fox News":false,
    "NBC News":false,
    "NDTV":false,
    "New York\nTime":false,
    "Wall Street\nJournal":false,

  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Provided By"),
            SizedBox(height: 20,),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              childAspectRatio: 3.5,
              mainAxisSpacing: 20,
              children: List.generate(
                allvals.keys.length, 
                (index) {
                  var key=allvals.keys.elementAt(index);

                  return Container(
                    
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(width: 2,color: Colors.black)),
                          value: allvals[key],
                          onChanged: (p){
                            print(allvals[key]);
                            setState(() {
                              allvals[key]=p!;
                            });
                          }
                        ),
                        //SizedBox(width: ,),
                        Text(key,style: medium16(),softWrap: true,maxLines: 2,),
                        
                        SizedBox(width: 10,),
                      ],
                    )
                  );
                })
              
              
              
              
            )
            

          ],
        )
      ),
      bottomNavigationBar:Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shadowColor: Colors.black87,
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            minimumSize: const Size.fromHeight(60),
          ),
          onPressed: (){
            //Navigator.of(context).pushReplacement(CustomRoute(child: _signin?navHomepage():OtpScreen(),time:Duration(milliseconds: 1200)));
          },
          
          child: const Text('Save',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),))
      ),
    );
  }
}