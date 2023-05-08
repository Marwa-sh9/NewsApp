import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/counter/cubit/cubit.dart';
import 'package:newsapp/Modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {

  @override
  Widget build (BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (context,state) {} ,
        builder: (context,state){
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.greenAccent,
              shadowColor: Colors.green,
              elevation: 5.5,
              // leading: Icon(
              //   Icons.menu,
              //   color:Colors.black,
              // ),
              title:Text('Counter' , style: TextStyle
                (
                color:Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),

            ),
            body:Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).Minus();
                  },
                    child:Text(
                      'Minus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ) ,),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text('${CounterCubit.get(context).counter}',style:
                    TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,

                    ),),
                  ),
                  TextButton(onPressed: ()
                  {
                    CounterCubit.get(context).Plus();
                  },
                    child:Text(
                      'Plus',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ) ,),

                ],
              ),
            ),
          );
        },

      ),
    );
  }
}