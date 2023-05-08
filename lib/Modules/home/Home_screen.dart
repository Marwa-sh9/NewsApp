import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        shadowColor: Colors.green,
        elevation: 5.5,
        leading: Icon(
          Icons.menu,
        ),
          title:Text('My App'),
        actions: [
         IconButton(
           icon:Icon(Icons.notification_important) ,
           onPressed:(){} ,
         ),
          IconButton(
            icon:Icon(Icons.search) ,
            onPressed:(){} ,
          ),
        ],

      ),
      body:SafeArea(
          child: Text('hi'),
      ) ,

    );

  }
}
