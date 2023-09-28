import 'package:flutter/material.dart';
import 'package:ricovi/helpers/textstyles.dart';

Widget NotificationItem(String imageurl,String text,DateTime dt){
    return Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(imageurl),radius: 32.5,),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text.substring(0,33),style:medium14().copyWith(fontWeight: FontWeight.w600),softWrap: false,maxLines:1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 8,),
            Text(DateTime.now().difference(dt).inHours==0?'${DateTime.now().difference(dt).inMinutes} minutes ago':'${DateTime.now().difference(dt).inHours} hours ago',style:medium14(),softWrap: false,maxLines:1,overflow: TextOverflow.ellipsis,)
            
          ],
        )
      ],
    );
  }