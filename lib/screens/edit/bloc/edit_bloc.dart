import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_todo/repositaries/api/fuctions.dart';


part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial()) {
    on<EditNoteEvent>(editNoteEvent);
  }

  FutureOr<void> editNoteEvent(EditNoteEvent event, Emitter<EditState> emit) async{
  final isSuccess=await Api.update(event.id, event.map);
 
  if (isSuccess) {
    emit(EditSuccessState());
  } else {
    emit(EditFailedState()); 
  }
  }
}
