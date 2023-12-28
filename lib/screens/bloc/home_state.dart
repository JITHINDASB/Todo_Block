part of 'home_bloc.dart';


sealed class HomeState {}

abstract class HomeActions extends HomeState{}


final class HomeInitial extends HomeState {}


final class LoadingState extends HomeState{}

final class SuccessState extends HomeState{
  List todoList=[];
  SuccessState ({required this.todoList});

}


final class ErrorState extends HomeState{}

final  class NavigationState extends HomeActions{}

final class ShowPopState extends HomeActions{}

final class DatadeleteState extends HomeActions{}

final class UpdateNavigtaionState extends HomeActions{
  final String id;
  final Map map;
  UpdateNavigtaionState({required this.id,required this.map});
  
}
