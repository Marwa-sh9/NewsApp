import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/Done_tasks/Done_Tasks_screen.dart';
import 'package:newsapp/Shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import '../../Modules/Archive_Tasks/Archive_tasks_screen.dart';
import '../../Modules/new_tasks/new_tasks_screen.dart';
import '../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> screen=
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> title=
  [
    'Tasks',
    'Done',
    'Archived'
  ];

  void changeIndex(int index)
  {
    currentIndex =index;
    emit(AppChangeBottomNavBarState());
  }

  Database? database;
  List<Map> tasks=[];
  List<Map> donetasks=[];
  List<Map> archivetasks=[];


  void createDataBase() 
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate:(database,version)
      {
        print('Created');
        database.execute('CREATE TABLE Tasks'
            '(id INTEGER PRIMARY KEY,'
            'title TEXT,'
            'date TEXT,'
            'time TEXT,'
            'status TEXT)').then((value)
        {
          print('table Created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        getDataFromDataBase(database);
        print('opened');
      },
    ).then((value)
     {
       database=value;
       emit(AppCreateDataBaseState());
     }
     );
  }

   insertToDataBase({
    @required String? title,
    @required String? time,
    @required String? date,
   // @required String? status,
  }) async
  {
    await database?.transaction((txn) async
    {
      txn
          .rawInsert(
          'INSERT INTO Tasks(title,date ,time)VALUES('
              '"$title","$date","$time")'
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataBaseState());

        getDataFromDataBase(database);
      }).catchError((error){
        print('error when inserting new Record${error.toString()}');
      });

      return null;
    });
  }

  void getDataFromDataBase(database)
  {
    tasks=[];
    donetasks=[];
    archivetasks=[];

    emit(AppGetDataBaseLoadingState());
    database!.rawQuery('Select * from Tasks').then((value)
    {
      tasks=value;
      value.forEach((element)
      {
      if(element['status']=='new')
        tasks.add(element);
      else if(element['status']=='done')
        donetasks.add(element);
      else
        archivetasks.add(element);
      });
      emit(AppGetDataBaseState());
    });
  }

  bool isBottomSheetShow=false;
  IconData fabIcon=Icons.edit;

  void UpdateSataBase(
  {
    @required String? status,
    @required int? id,
  }) async
  {
   database!.rawUpdate('UPDATE Tasks set status =? where id =?',
   ['$status',id],)
       .then((value)
       {
         getDataFromDataBase(database);
         emit(AppUpateDataBaseState());
       });
  }
  void DeleteDataBase({
    @required int? id,
  }) async
  {
    database!.rawDelete('Delete from Tasks where id =? ',
        [id],
    ).then((value)
    {
      getDataFromDataBase(database);
      emit(AppDeleteDataBaseState());

    });
  }
  void ChangeBottomSheetState (
      {
        @required bool? isShow,
        @required IconData? icon,
      })
  {
    isBottomSheetShow=isShow!;
    fabIcon=icon!;

    emit(AppChangeBottomSheetState());
  }

  bool isDark=false;
  ThemeMode appMode = ThemeMode.dark;
  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null )
      {
        isDark=fromShared;
        emit(AppChangeModeState());
      }
    else
      {
        isDark=!isDark;
        CacheHelper.putBoolean(key:'isDark' ,value: isDark)
            .then((value)
        {
          emit(AppChangeModeState());
        });
      }

  }
}
