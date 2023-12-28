import 'package:block_todo/screens/bloc/home_bloc.dart';
import 'package:block_todo/screens/edit/bloc/edit_bloc.dart';
import 'package:block_todo/screens/form/bloc/add_bloc.dart';
import 'package:block_todo/screens/home/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context)=> AddBloc()),
          BlocProvider(
            create: (context) => EditBloc(),
           
          )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         
        colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        home: const TodoScreeen(),
      ),
    );
  }
}

