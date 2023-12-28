import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_todo/repositaries/api/fuctions.dart';


part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(AddIntial()) {
    on<AddTodoEvent>(addtodo);
  }

  FutureOr<void> addtodo(event, Emitter<AddState> emit) async{
   final isSucces= await Api.addone(event.map);
   if(isSucces){
    emit (AddTodoSuccessState());

   }else{
    emit(AddTodoErrorState());
   }
  }
}

