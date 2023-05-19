part of 'midoplan_cubit.dart';

@immutable
class MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanState(this.midoplans);
}

class MidoplanInitial extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanInitial(this.midoplans) : super(midoplans);
}

class MidoPlanAdded extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoPlanAdded(this.midoplans) : super(midoplans);
}

class MidoplanEdited extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanEdited(this.midoplans) : super(midoplans);
}

class MidoplanToggled extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanToggled(this.midoplans) : super(midoplans);
}

class MidoPlanError extends MidoplanState {
  final String message;
  
  const MidoPlanError(this.message, List<MidoPlan> midoplans) :super(midoplans);
}