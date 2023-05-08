import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() :super(CounterInitialState());

  // CounterCubit cubit =BlocProvider.of(context);

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void Minus()
  {
    counter--;
    emit(CounterMinusState());
  }

  void Plus()
  {
    counter++;
    emit(CounterPlusState());

  }
}