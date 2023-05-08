import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Shared/Components/components.dart';
import '../../../newsapp/cubit/cubit.dart';
import '../../../newsapp/cubit/states.dart';

class techcrunchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).techcrunch;
        return ArticaleBuilder(list,context);
      },
    );
  }
}
