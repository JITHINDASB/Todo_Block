part of 'add_bloc.dart';

abstract class AddEvent {}

  final class AddTodoEvent extends AddEvent{
    final Map map;
    AddTodoEvent({required this.map});
  
}
