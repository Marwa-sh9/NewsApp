import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../ModulesNews/web_view/Web_View_Screen.dart';
import '../cubit/cubit.dart';
Widget defaultButton({
 @required double width:double.infinity,
 @required Color color:Colors.greenAccent,
 @required Function()? function,
 bool isUppercase :true,
 @required String text:'',
})
=>
Container(
width: width,
color:color,
child: MaterialButton(
onPressed: function,
height: 60.0,
child:Text(
 isUppercase ? text.toUpperCase():text ,
style: TextStyle(
color:Colors.black,
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
),
),
);

Widget defaultFormField({
 @required TextEditingController ? controller,
 @required TextInputType ? type,
  Function(String)? onSubmit,
  Function(String)? onChange,
 Function()? onpress,
 @required FormFieldValidator<String>? validate,
 // @required Function(String)? validate,
 @required String? lable,
 @required IconData? prefixIc,
 IconData? suffixIc,
  bool ispassword =false,
 Function()? onTap,
 bool isClickable=true,
}) =>
TextFormField(
controller:controller,
keyboardType: type,
 onFieldSubmitted:onSubmit,
 obscureText:ispassword,
onChanged: onChange,
onTap:onTap ,
validator: validate,
enabled:isClickable ,
decoration: InputDecoration(
labelText: lable,
prefixIcon: Icon(
    prefixIc,
),
    suffixIcon:suffixIc!= null ? IconButton(
     onPressed: onpress,
      icon: Icon(
       suffixIc,
      ),
    ):null,
//  border: BorderRadius.circular(),
),
);

Widget buildTaskItem(Map model,context)=>Dismissible(
 key: Key(model['id'].toString()),
  child:   Padding(
   padding: const EdgeInsets.all(15.0),
   child: Row(
    children: [
     CircleAvatar(
      radius: 40,
      child: Text('${model['time']}'),
     ),
     SizedBox(

      width: 20,

     ),

     Expanded(

       child: Column(

        mainAxisSize: MainAxisSize.min,

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

         Text('${model['title']}',style:TextStyle(fontSize:20,

          fontWeight: FontWeight.bold,

         ),),

         Text('${model['date']}',style:TextStyle(fontSize:20,

         ),),

         // SizedBox(

         //  height: 7,

         // ),

         // Text('${model['status']}',style:TextStyle(fontSize:20,

         // ),),

        ],

       ),

     ),

     SizedBox(

      width: 20,

     ),

     IconButton(

         onPressed: ()

         {

          AppCubit.get(context).UpdateSataBase(

              status: 'done',

              id: model['id'],

          );

         },

         icon: Icon(Icons.check_box)),

     IconButton(

         onPressed: ()

         {

          AppCubit.get(context).UpdateSataBase(

           status: 'archive',

           id: model['id'],

          );

         },

         icon: Icon(Icons.archive_outlined)),



    ],

   ),

  ),
 onDismissed: (direction)
 {
  AppCubit.get(context).DeleteDataBase(id: model['id'],);
 },
);

Widget tasksBuilder({
 @required List<Map>? tasks,
})=> ConditionalBuilder(
 condition: tasks!.length>0 ,
 builder: (context)=>ListView.separated(
  itemBuilder:(context,index)
  {
   return buildTaskItem(tasks[index], context);
  },
  separatorBuilder: (context,index)=>
  MyDivider(),
  itemCount: tasks.length,),
 fallback: (context)=>Center(
  child: Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
    Icon(Icons.menu,),
    Text('No Tasks yet , please add some tasks'),
   ],
  ),
 ),

);

Widget MyDivider({
 Color color=Colors.greenAccent,
})=>Padding(
 padding: const EdgeInsets.all(5.0),
 child: Container(
  width: double.infinity,
  height: 1,
  color: color,
 ),
);

Widget buildArticaleItem(article,context)=>
    InkWell(
     onTap:()
     {
      navigateTo(context, WebviewScreen(article['url']),);
     },
      child: Padding(
 padding: const EdgeInsets.all(8.0),
 child: Row(
  children: [
   Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       //color: Colors.black,
       image: DecorationImage(
         image: NetworkImage
         (
         '${article['urlToImage']}'
         ),
         fit: BoxFit.cover,
       ),
      ),
   ),
   SizedBox(width: 20,),
   Expanded(
      child: Container(
       height: 120,
       child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Expanded(
           child: Text('${article['title']}',
            style:Theme.of(context).textTheme.bodyText1,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
           ),
         ),
         Text('${article['publishedAt']}',
          style: TextStyle(color:Colors.grey),
         ),

        ],
       ),
      ),
   ),
  ],
 ),
),
    );

Widget ArticaleBuilder (list,context,{isSearch=false})=>ConditionalBuilder(
 condition:  list.length>0,
 builder:(context)=>ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder:(context,index) =>buildArticaleItem(
   list[index],context
  ),
  separatorBuilder: (context,index)=> MyDivider(
      color: Color(0xffad8af1)
  ),
  itemCount: 10,) ,
 fallback:(context)=> isSearch? Container():
     Center(
      child: CircularProgressIndicator(),
     ),

);

void navigateTo(context,widget)=>Navigator.push(
 context,
MaterialPageRoute(builder:(context)=>widget,),
);