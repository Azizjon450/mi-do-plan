import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_cub/data/models/midoplan.dart';
import 'package:to_do_cub/logic/midoplan/midoplan_cubit.dart';

part 'completed_midoplans_state.dart';

class CompletedMidoplansCubit extends Cubit<CompletedMidoplansState> {
  late final StreamSubscription midoplanSubscription;
  final MidoplanCubit midoplanCubit;
  CompletedMidoplansCubit(this.midoplanCubit) : super(CompletedMidoplansInitial()) {
    midoplanSubscription = midoplanCubit.stream.listen((MidoplanState state) { 
      getCompletedMidoplans();
    });
  }

  void getCompletedMidoplans() {
    final midoplans = midoplanCubit.state.midoplans!.where((midoplan) => midoplan.isDone).toList();
    emit(CompletedMidoplansLoaded(midoplans));
  }

  @override
  Future<void> close() {
    midoplanSubscription.cancel();
    return super.close();
  }
}
