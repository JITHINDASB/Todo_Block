import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_todo/repositaries/api/fuctions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchScuccessEvent>(fechData);
    on<FormNavigationEvent>(fechNavigation);
    on<ShowDialogEvent>(showDialog);
    on<DeleteEvent>(deleteEvent);
    on<UpdateNavigationEvent>(updataEvent);
  }

  FutureOr<void> fechNavigation(
      FormNavigationEvent event, Emitter<HomeState> emit) async {
    emit(NavigationState());
  }

  FutureOr<void> fechData(
    FetchScuccessEvent event, Emitter<HomeState> emit) async {
    emit(LoadingState());
    final todo = await Api.fetchdata();
    if (todo!.isNotEmpty) {
      emit(SuccessState(todoList: todo));
    } else {
      emit(ErrorState());
    }
  }

  FutureOr<void> showDialog(
    ShowDialogEvent event, Emitter<HomeState> emit) {
    emit(ShowPopState());
  }

  FutureOr<void> deleteEvent(
    DeleteEvent event, Emitter<HomeState> emit) async{
   final isSuccess=await Api.deletid(event.id);
 
   if (isSuccess) {
     emit (DatadeleteState());
   } else {
     print(isSuccess);
   }
    
  }



  FutureOr<void> updataEvent(
    UpdateNavigationEvent event, Emitter<HomeState> emit) {
    
 emit (UpdateNavigtaionState(id: event.id, map: event.map));
  }
}
