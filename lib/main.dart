import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/Modules/login/login_screen.dart';
import 'package:newsapp/Modules/messenger/Messengre_screen.dart';
import 'package:newsapp/Shared/cubit/cubit.dart';
import 'package:newsapp/Shared/cubit/states.dart';
import 'package:newsapp/Shared/network/local/cache_helper.dart';
import 'package:newsapp/newsapp/cubit/cubit.dart';
import 'package:newsapp/newsapp/news_layout.dart';
import 'Modules/counter/Counter_Screen.dart';
import 'Shared/bloc_observer.dart';
import 'Shared/styles/themes.dart';
import 'layout/home_layout.dart';
import 'package:newsapp/Shared/network/remote/dio_helper.dart';

import 'shopModules/shop_app/on_boarding/on_boarding_screen.dart';

void main() async
{
  //بيتأكد من كل الميثودات بعدين بيفتح التطبيق
  // WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  // final bool isDark;
  //MyApp(this.isDark);
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness(),),
        BlocProvider(  create: (BuildContext context)=>AppCubit()..changeAppMode(
          //fromShared: isDark,
        ),
        )
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp (
            debugShowCheckedModeBanner: false,
            //start
            theme: lightTheme,
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            darkTheme: darkTheme,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: news_layout(),
            ),
            // routes: {
            //   'messenger_screen': (context) {
            //     return messenger_screen();
            //   },
            // },
          );
        },
      ),
    );
  }
}
