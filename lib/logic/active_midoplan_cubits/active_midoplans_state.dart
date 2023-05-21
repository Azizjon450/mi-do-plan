part of 'active_midoplans_cubit.dart';

@immutable
abstract class ActiveMidoplansState {}

class ActiveMidoplansInitial extends ActiveMidoplansState {}

class ActiveMidoplansLoaded extends ActiveMidoplansState{
  final List<MidoPlan> midoplans;

  ActiveMidoplansLoaded(this.midoplans);
}
