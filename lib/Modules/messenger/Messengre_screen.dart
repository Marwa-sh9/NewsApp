import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messenger_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight:100 ,
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.green,
        elevation: 0.5,
        titleSpacing: 12,
        title:
        Row(
          children: [
            CircleAvatar
            (
            radius: 22.0,
            backgroundImage:
            NetworkImage(
                'https://img.freepik.com/premium-vector/portrait-caucasian-woman-avatar-female-person-vector-icon-adult-flat-style-headshot_605517-26.jpg?w=2000'
            ),
      ),
        SizedBox(
          width: 10,
        ),
        Text('chats' , style: TextStyle
          (
          color:Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        ),
          ],
        ),
        actions: [
          IconButton(
            icon:CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20.0,
              child: Icon(
                  Icons.camera_alt_outlined,
              color:Colors.black,
                size: 25.0,
              ),
            ) ,
            onPressed:(){} ,
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            icon:CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.white,
              child: Icon
                (Icons.edit,
                color:Colors.black,
                size: 25.0,
              ),
            ) ,
            onPressed:(){} ,
          ),
        ],

      ),
      body:
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column
             (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular
                      (20),
                    color:Colors.black26 ,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Search'
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5    ,
                ),
                Container(
                  height:92,
                  child: ListView.separated(
                   // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context , index)=>buildStoryItem(),
                    separatorBuilder: (context,index)=>SizedBox(
                      width: 7,
                    ),
                    itemCount: 10 ,
                  ),
                ),
                SizedBox(
                 height: 5   ,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context , index)=>buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(
                    height: 8,
                  ),
                  itemCount: 15 ,
                ),

              ],
        ),
          ),
        ),

    );
  }

  // 1. build item
  // 2. build list
  // 3. add item to list

//arrow fun one return
  Widget buildChatItem()=>Row(
   children: [
     Stack(
       alignment:AlignmentDirectional.bottomEnd,
       children: [
         CircleAvatar(
           radius: 30,
           backgroundColor: Colors.greenAccent,
         ),
         Padding(
           padding: const EdgeInsetsDirectional.only(
             bottom: 5,end: 5,),
           child: CircleAvatar(
             radius: 8,
             backgroundColor: Colors.white,
           ),
         ),
         Padding(
           padding: const EdgeInsetsDirectional.only(
             bottom: 5,end: 5,
           ),
           child: CircleAvatar(
             radius: 7,
             backgroundColor: Colors.red,
           ),
         ),
       ],
     ),
     SizedBox(
       width: 8,
     ),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Marwa alesh',
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 16,
             ),
           ),
           SizedBox(
             height: 5,
           ),
           Row(
             children:[
               Expanded(child:
               Text('hjgjhbvhjlkjnkihkljlk,huighbiuhbuihjhniunhjkbkguygiuyhjnbn',
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,
               )),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10),
                 child: Container(
                   width: 5,
                   height: 5,
                   decoration: BoxDecoration(
                     color:Colors.blue,
                     shape: BoxShape.circle,
                   ),
                 ),
               ),
               Text('1:5 pm'),


             ],
           ),

         ],
       ),
     ),

   ],
 );
  Widget buildStoryItem()=> Container(
    width: 60,
    child: Column(

      children: [
        Stack(
          alignment:AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.greenAccent,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 5,end: 5,),
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 5,end: 5,
              ),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
              ),
            ),

          ],
        ),
        SizedBox(
          height: 3,
        ),
        Text
          (
          'Marwa',
          maxLines: 2,
          overflow:TextOverflow.ellipsis ,

        ),
      ],
    ),
  );
}
