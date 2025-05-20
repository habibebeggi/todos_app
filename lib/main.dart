import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/ui/cubits/main_cubit.dart';
import 'package:todos_app/ui/cubits/save_cubit.dart';
import 'package:todos_app/ui/cubits/update_cubit.dart';
import 'package:todos_app/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context) => SaveCubit()),
         BlocProvider(create: (context) => DetailCubit()),
         BlocProvider(create: (context) => MainCubit()),
       ], 
       child: MaterialApp(
         title: 'Flutter Demo',
             debugShowCheckedModeBanner: false,
         theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         ),
         home: const MainScreen(),
       ),
   );
  }
}