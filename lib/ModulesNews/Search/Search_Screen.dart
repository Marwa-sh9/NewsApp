import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Shared/Components/components.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/cubit/states.dart';

class SearchScreen extends StatelessWidget
{
  var searchCotroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
      appBar: AppBar(),
      body: Column(
      children:
      [
      Padding(
      padding: const EdgeInsets.all(20.0),
      child: defaultFormField(
      controller: searchCotroller,
      type: TextInputType.text,
      onChange: (value)
      {
        NewsCubit.get(context).getSearch(value);
      },
      validate: (String ? value)
      {
      if(value!.isEmpty)
      {
      return 'search must not be empty';
      }
      },
      lable: 'Search',
      prefixIc: Icons.search,
      ),
      ),
      Expanded(child: ArticaleBuilder(list, context,isSearch: true)),
      ],
        ),
        );

      },
    );
  }
}
