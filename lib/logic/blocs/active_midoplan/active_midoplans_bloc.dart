import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/midoplan.dart';
import '../midoplan/midoplan_bloc.dart';

part 'active_midoplans_event.dart';
part 'active_midoplans_state.dart';

class ActiveMidoplansBloc
    extends Bloc<ActiveMidoplansEvent, ActiveMidoplansState> {
  //late final StreamSubscription midoplanBlocSubscription;
  final MidoplanBloc midoplanBloc;
  ActiveMidoplansBloc(this.midoplanBloc) : super(ActiveMidoplansInitial()) {
    // midoplanBlocSubscription = midoplanBloc.stream.listen(
    //   (event) {
    //     add(LoadActiveMidoplansEvent());
    //   },
    // );
    on<LoadActiveMidoplansEvent>(_getActiveMidoplans);
  }

  void _getActiveMidoplans(
      LoadActiveMidoplansEvent event, Emitter<ActiveMidoplansState> emit) {
    final midoplans = midoplanBloc.state.midoplans!
        .where((midoplan) => !midoplan.isDone)
        .toList();
    emit(ActiveMidoplansLoaded(midoplans));
  }

  @override
  Future<void> close() {
    //midoplanBlocSubscription.cancel();
    return super.close();
  }
}
