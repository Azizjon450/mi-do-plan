part of 'midoplan_cubit.dart';

@immutable
class MidoplanState {
  final List<MidoPlan>? midoplans;

  const MidoplanState({this.midoplans});
}

class MidoplanInitial extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanInitial(this.midoplans) : super();
}

class MidoPlanAdded extends MidoplanState {}

class MidoplanEdited extends MidoplanState {}

class MidoplanToggled extends MidoplanState {}

class MidoplanDeleted extends MidoplanState {}


class MidoPlanError extends MidoplanState {
  final String message;
  
  const MidoPlanError(this.message);
}