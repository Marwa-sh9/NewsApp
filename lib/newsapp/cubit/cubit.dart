import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/ModulesNews/new_tasks/science/science_Screen.dart';
import 'package:newsapp/ModulesNews/new_tasks/sports/Sports_Screen.dart';
import 'package:newsapp/ModulesNews/settings/settings_Screen.dart';
import 'package:newsapp/newsapp/cubit/states.dart';
import '../../ModulesNews/new_tasks/business/business_screen.dart';
import '../../Shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem =
  [
    BottomNavigationBarItem(icon: Icon
      (
      Icons.business_center_rounded,
    ),
      label: 'Business',
    ),
    BottomNavigationBarItem(icon: Icon
      (
        Icons.web),
      label: 'techcrunch',
    ),
    BottomNavigationBarItem(icon: Icon
      (
        Icons.science),
      label: 'wsj',
    ),
    // BottomNavigationBarItem(icon:Icon
    //   (
    //     Icons.settings),
    //   label: 'settings',
    // ),
  ];

  List<Widget> Screens = [
    BusinessScreen(),
    techcrunchScreen(),
    wsjScreen(),
    //  settingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1)
      gettechcrunch();
    if (index == 2)
      getwsj();
    emit(NewsbottomNavState());
  }


  List<dynamic> Business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      //   country=us&category=business
      url: 'v2/top-headlines',
      query:
      {
        'country': 'us',
        'category': 'business',
        'apiKey': '5e0e80acf5314e6982977f7d3941f81e',
      },
    ).then((value) {
      //print(value?.data['totalResults']);
      Business = value?.data['articles'];
      print(Business[0]['title']);

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print('m' + error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> techcrunch = [];

  void gettechcrunch() {
    emit(NewsGettechcrunchLoadingState());
    if (techcrunch.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'sources': 'techcrunch',
          'apiKey': '5e0e80acf5314e6982977f7d3941f81e',
        },
      ).then((value) {
        //print(value?.data['totalResults']);
        techcrunch = value?.data['articles'];
        print(techcrunch[0]['title']);

        emit(NewsGettechcrunchSuccessState());
      }).catchError((error) {
        print('m' + error.toString());
        emit(NewsGettechcrunchErrorState(error.toString()));
      });
    } else {
      emit(NewsGettechcrunchSuccessState());
    }
  }

//https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5e0e80acf5314e6982977f7d3941f81e

  List<dynamic> wsj = [];

  void getwsj() {
    emit(NewsGetwsjLoadingState());

    if (wsj.length == 0) {
      DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'domains': 'wsj.com',
          'apiKey': '5e0e80acf5314e6982977f7d3941f81e',
        },
      ).then((value) {
        //print(value?.data['totalResults']);
        wsj = value?.data['articles'];
        print(wsj[0]['title']);

        emit(NewsGetwsjSuccessState());
      }).catchError((error) {
        print('m' + error.toString());
        emit(NewsGetwsjErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetwsjSuccessState());
    }
  }

  //
  // bool isDark=false;
  // ThemeMode appMode = ThemeMode.dark;
  // void changeAppMode()
  // {
  //   isDark=!isDark;
  //   emit(AppChangeModeState());
  // }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetsearchLoadingState());

    //search = [];

     DioHelper.getData(
     //https://newsapi.org/v2/everything?
      // q=tesla&
      // apiKey=5e0e80acf5314e6982977f7d3941f81e
      url: 'v2/everything',
      query:
      {
        'q': '$value',
        'apiKey': '5e0e80acf5314e6982977f7d3941f81e',
      },
    ).then((value) {
      //print(value?.data['totalResults']);
      search = value?.data['articles'];
      print(search[0]['title']);

      emit(NewsGetsearchSuccessState());
    }).catchError((error) {
      print('m' + error.toString());
      emit(NewsGetsearchErrorState(error.toString()));
    });
  }
}
