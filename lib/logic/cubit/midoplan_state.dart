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

class MiDoPlanAdded extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MiDoPlanAdded(this.midoplans) : super(midoplans);
}

class MiDoPlanError extends MidoplanState {
  final String message;
  
  const MiDoPlanError(this.message, List<MidoPlan> midoplans) :super(midoplans);
}