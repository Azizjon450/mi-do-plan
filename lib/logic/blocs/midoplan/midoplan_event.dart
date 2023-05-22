part of 'midoplan_bloc.dart';

@immutable
abstract class MidoplanEvent {}

class LoadMidoplanEvent extends MidoplanEvent {}

class AddNewMidoplanEvent extends MidoplanEvent {
  final String title;

  AddNewMidoplanEvent(this.title);
}

class EditMidoplanEvent extends MidoplanEvent {
  final String id;
  final String title;

  EditMidoplanEvent(this.id, this.title);
}

class ToggleMidoplanEvent extends MidoplanEvent {
  final String id;

  ToggleMidoplanEvent(this.id);
}

class DeleteMidoplanEvent extends MidoplanEvent {
  final String id;

  DeleteMidoplanEvent(this.id);
}