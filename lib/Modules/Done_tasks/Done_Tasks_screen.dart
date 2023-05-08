import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/cubit/cubit.dart';
import '../../Shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var tasks=AppCubit.get(context).donetasks;
        return  tasksBuilder(tasks: tasks);
      },
    );
  }
}
