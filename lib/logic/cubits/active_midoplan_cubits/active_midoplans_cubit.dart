import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/midoplan.dart';
import '../midoplan/midoplan_cubit.dart';

part 'active_midoplans_state.dart';

class ActiveMidoplansCubit extends Cubit<ActiveMidoplansState> {
  late final StreamSubscription midoplanSubscription;
  final MidoplanCubit midoplanCubit;
  ActiveMidoplansCubit(this.midoplanCubit) : super(ActiveMidoplansInitial()) {
    midoplanSubscription = midoplanCubit.stream.listen((MidoplanState state) { 
      getActiveMidoplans();
    });
  }

  void getActiveMidoplans() {
    final midoplans = midoplanCubit.state.midoplans!.where((midoplan) => !midoplan.isDone).toList();
    emit(ActiveMidoplansLoaded(midoplans));
  }

  @override
  Future<void> close() {
    midoplanSubscription.cancel();
    return super.close();
  }
}
