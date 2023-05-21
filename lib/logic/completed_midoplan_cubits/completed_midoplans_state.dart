part of 'completed_midoplans_cubit.dart';

@immutable
abstract class CompletedMidoplansState {}

class CompletedMidoplansInitial extends CompletedMidoplansState {}

class CompletedMidoplansLoaded extends CompletedMidoplansState{
  final List<MidoPlan> midoplans;

  CompletedMidoplansLoaded(this.midoplans);
}
