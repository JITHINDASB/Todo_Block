import 'package:block_todo/screens/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TOdoCard extends StatelessWidget {
  const TOdoCard({
    super.key,
    required this.noteId,
    required this.todo,
  });

  final String noteId;
  final Map todo;

  @override
 Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<HomeBloc>()
          .add(UpdateNavigationEvent(id: noteId, map: todo)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.inversePrimary,
              width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      todo['title'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(ShowDialogEvent());
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
              Flexible(
                  child: Text(
                todo['description'] ?? '',
                overflow: TextOverflow.fade,
              )),
            ],
          ),
        ),
      ),
    );
  }
}


