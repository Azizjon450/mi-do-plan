part of 'midoplan_cubit.dart';

@immutable
abstract class MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanState(this.midoplans);
}

class MidoplanInitial extends MidoplanState {
  final List<MidoPlan> midoplans;

  const MidoplanInitial(this.midoplans) : super(midoplans);
}
