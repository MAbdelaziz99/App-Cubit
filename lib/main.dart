import 'package:app_cubit/modules/home/cubit/home_cubit.dart';
import 'package:app_cubit/modules/home/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context) => HomeCubit()..getCategories(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeLayout(),
        ));
  }
}