import 'package:block_todo/screens/bloc/home_bloc.dart';
import 'package:block_todo/screens/edit/bloc/edit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final formkey = GlobalKey<FormState>();
final titleController = TextEditingController();
final discriptionController = TextEditingController();

class Editdata extends StatefulWidget {
  const Editdata({super.key, required this.id, required this.map});
  final String id;
  final Map map;
  @override
  State<Editdata> createState() => _EditdataState();
}

class _EditdataState extends State<Editdata> {
  @override
  void initState() {
    super.initState();
    final todo = widget.map;
    titleController.text = todo['title'];
    discriptionController.text = todo['description'];
  }

  @override
  void dispose() {
    super.dispose();
    titleController.text = "";
    discriptionController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<EditBloc, EditState>(
        buildWhen: (previous, current) => current is! EditActionState, 
        listenWhen: (previous, current) => current is EditActionState,
        listener: (context, state) {
          if (state is EditSuccessState) {
            Navigator.of(context).pop();
            alert(Colors.green,"Data updated Successfuly!!"); 

            
          } else if (State is EditFailedState) {
            alert(Colors.red, "Data Not updated!!");
          }
        },
        builder: ((context, state) {
          return Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Title',
                        hintStyle: TextStyle(fontSize: 20)),
                    validator: (value) => titleController.text.isEmpty
                        ? 'Please enter a title'
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: discriptionController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Description',
                        hintStyle: TextStyle(fontSize: 20)),
                    validator: (value) => discriptionController.text.isEmpty
                        ? 'Please enter a description'
                        : null,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon
                  (onPressed: (){
                    if(formkey.currentState!.validate()){
                      update(context, widget.id);
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Update'),
                  style: const ButtonStyle(elevation: MaterialStatePropertyAll(5),
                  shape: MaterialStatePropertyAll(
                    ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))
                  )),
                   )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
    void update(BuildContext context, String id) {
    final title = titleController.text;
    final description = discriptionController.text;

    final map = {
      'title': title,
      'description': description,
    };
    context.read<EditBloc>().add(EditNoteEvent(id: id, map: map));
  }
  
  void alert(Color color ,String message) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(10),
                duration: const Duration(seconds: 1),
                backgroundColor: color,
                content:  Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                )));
                        context.read<HomeBloc>().add(FetchScuccessEvent()); 

  }
}
