import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/states.dart';
import '../ModulesNews/Search/Search_Screen.dart';
import '../Shared/Components/components.dart';
import '../Shared/cubit/cubit.dart';
import '../Shared/network/remote/dio_helper.dart';


class news_layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit =NewsCubit.get(context);
       return Scaffold(
          appBar: AppBar(
            title: Text(
              'New App',
            ),
            actions: [
              IconButton(
                  onPressed:()
                  {
                    navigateTo(context,SearchScreen(),);
                  },
                  icon: Icon(
                    Icons.search,
                    ),
              ),
              IconButton(
                onPressed:()
                {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.mode_night,
                ),
              ),
            ],
          ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomItem ,
          ),
        );
      },
    );
  }
}
