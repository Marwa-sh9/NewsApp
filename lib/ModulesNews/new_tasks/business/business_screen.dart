import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Components/components.dart';
import 'package:newsapp/Shared/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/states.dart';

class BusinessScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).Business;
        return ArticaleBuilder(list,context);
      },
    );
  }
}
