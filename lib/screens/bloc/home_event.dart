part of 'home_bloc.dart';


sealed class HomeEvent {}

abstract class HomeActionsEvent extends HomeEvent{}

final class FetchDataEvent extends HomeEvent{}

final class FetchScuccessEvent extends HomeActionsEvent{}

final class FormNavigationEvent extends HomeActionsEvent{}

final class DeleteEvent extends  HomeActionsEvent{
  final String id ;
  DeleteEvent({required this.id});
}

final class ShowDialogEvent extends HomeActionsEvent{}

final class UpdateNavigationEvent extends HomeActionsEvent{
  final String id;
  final Map map;
  UpdateNavigationEvent({required this.id,required this.map});

}

