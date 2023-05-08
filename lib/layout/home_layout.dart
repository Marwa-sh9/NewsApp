import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Modules/Archive_Tasks/Archive_tasks_screen.dart';
import 'package:newsapp/Modules/Done_tasks/Done_Tasks_screen.dart';
import 'package:newsapp/Modules/new_tasks/new_tasks_screen.dart';
import 'package:newsapp/Shared/Components/components.dart';
import 'package:newsapp/Shared/Components/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:conditional_builder/conditional_builder.dart';

import '../Shared/cubit/cubit.dart';
import '../Shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  //var StateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      AppCubit()
        ..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state)
        {
          if(state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.greenAccent,
              shadowColor: Colors.green,
              elevation: 5.5,
              leading: Icon(
                Icons.menu,
              ),
              title: Text(
                cubit.title[cubit.currentIndex],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notification_important),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataBaseLoadingState,
              builder: (context) => cubit.screen[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton
              (
              onPressed: () //async
              {
                if (cubit.isBottomSheetShow) {
                  if (formkey.currentState?.validate() == true) {
                    cubit.insertToDataBase(
                      title: titleController.text,
                        time: timeController.text,
                        date: dateController.text,
                       // status: StateController.text,
                    );
                  }
                }
                else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) =>
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.grey[300],
                            child: Form(
                              key: formkey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (String?value) {
                                        if (value!.isEmpty) {
                                          return 'title must not empty';
                                        }
                                        return null;
                                      },
                                      lable: 'Task title ',
                                      prefixIc: Icons.title
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFormField(
                                    controller: dateController,
                                    lable: 'Date',
                                    prefixIc: Icons.calendar_today,
                                    type: TextInputType.datetime,
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2023-08-11'),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'date must not empty ! ';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  defaultFormField(
                                    controller: timeController,
                                    lable: 'Time',
                                    prefixIc: Icons.watch_later_outlined,
                                    type: TextInputType.datetime,
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then((value) {
                                        //timeController.text=TimeOfDayFormat.HH_dot_mm.toString().format(value);
                                        timeController.text =
                                            value!.format(context).toString();
                                        print(value.format(context));
                                      });
                                    },
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'time must not empty ! ';
                                      }
                                      return null;
                                    },
                                  ),
                                  // SizedBox(
                                  //   height: 15,
                                  // ),
                                  // defaultFormField(
                                  //   controller: StateController,
                                  //   lable: 'Status',
                                  //   prefixIc: Icons.text_fields,
                                  //   type: TextInputType.text,
                                  //   // onTap:()
                                  //   // {
                                  //   //   show(
                                  //   //     context: context,
                                  //   //     initialTime: TimeOfDay.now(),
                                  //   //   ).then((value)
                                  //   //   {
                                  //   //     //timeController.text=value?.format(context).toString();
                                  //   //     print(value?.format(context));
                                  //   //   });
                                  //   // } ,
                                  //   validate: (value) {
                                  //     if (value!.isEmpty) {
                                  //       return 'Status must not empty ! ';
                                  //     }
                                  //     return null;
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    //elevation: 50.0,
                  )
                      .closed
                      .then((value) {
                    cubit.ChangeBottomSheetState(
                        isShow: false,
                        icon: Icons.edit
                    );
                  });
                  cubit.ChangeBottomSheetState(isShow: true,
                      icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline,),
                  label: 'Done',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',

                ),
              ],
            ),

          );
        },
      ),
    );
  }

  Future<String> getName() async
  {
    return 'Marwa';
  }

}
