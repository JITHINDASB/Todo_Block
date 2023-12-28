import 'package:block_todo/screens/bloc/home_bloc.dart';
import 'package:block_todo/screens/edit/edit.dart';
import 'package:block_todo/screens/form/addtodo.dart';
import 'package:block_todo/screens/ui.dart/card.dart';
import 'package:block_todo/screens/ui.dart/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




final title =TextEditingController();
final description=TextEditingController();

class TodoScreeen extends StatefulWidget {
  const TodoScreeen({super.key});

  @override
  State<TodoScreeen> createState() => _TodoScreeenState();
}

class _TodoScreeenState extends State<TodoScreeen> { 
  
      late String id;
      late Map todo;

      @override
      Widget build(BuildContext context){
        context.read<HomeBloc>().add(FetchScuccessEvent()); 
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
             body: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is! HomeActions,
        listenWhen: (previous, current) => current is HomeActions,
        listener: (context, state) {
          if (state is NavigationState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAdd(),
                ));
          } else if (state is ShowPopState) {
           
            alertMessage(context,id);
            context.read<HomeBloc>().add(FetchScuccessEvent()); 
          } else if (state is UpdateNavigtaionState) { 
            Navigator.push( 
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Editdata(id: state.id, map: state.map),
                ));
          }
        },
        builder: (context, state) {
          if (state is SuccessState) {
            return GridView.count(
              padding: const EdgeInsets.all(8),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(state.todoList.length, (index) {
                todo = state.todoList[index] as Map;
                id = todo['_id'];
                return TOdoCard(noteId: id, todo: todo);
              }),
            );
          } else if (state is LoadingState) {
            return const SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator()));
          } else {
            return const SizedBox.expand(
              child: Center(child: Text('empty ')),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<HomeBloc>().add(FormNavigationEvent()),
        child: const Icon(Icons.add),
      ),
    );
  }

  
}