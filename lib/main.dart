import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_test/cubits/get_body_data/get_body_data_cubit.dart';
import 'package:store_test/cubits/get_data_cate/get_data_cate_cubit.dart';
import 'package:store_test/cubits/get_data_cubit/get_data_cubit.dart';

import 'Screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetDataCubit(),
        ),
        BlocProvider(
          create: (context) => GetDataCateCubit(),
        ),
        BlocProvider(
          create: (context) => GetBodyDataCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Store App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
