
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image(
          //     image:AssetImage('shopImage/a.jpg'),
          // ),
          SizedBox(height: 10,),
          Text(
            'screen Title',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 10,),
          Text(
            'screen body',style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),),
          //PageView.builder(itemBuilder: (context,))
        ],
      ),
    );
  }
}
