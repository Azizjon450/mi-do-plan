import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_cub/data/models/midoplan.dart';
import 'package:to_do_cub/logic/blocs/midoplan/midoplan_bloc.dart';

part 'completed_midoplans_event.dart';
part 'completed_midoplans_state.dart';

class CompletedMidoplansBloc
    extends Bloc<CompletedMidoplansEvent, CompletedMidoplansState> {
  //late final StreamSubscription midoplanBlocSubscription;
  final MidoplanBloc midoplanBloc;
  CompletedMidoplansBloc(this.midoplanBloc) : super(CompletedMidoplansInitial()) {
    // midoplanBlocSubscription = midoplanBloc.stream.listen(
    //   (event) {
    //     add(LoadCompletedMidoplansEvent());
    //   },
    // );
    on<LoadCompletedMidoplansEvent>(_getCompletedMidoplans);
  }

  void _getCompletedMidoplans(
      LoadCompletedMidoplansEvent event, Emitter<CompletedMidoplansState> emit) {
    final midoplans = midoplanBloc.state.midoplans!
        .where((midoplan) => midoplan.isDone)
        .toList();
    emit(CompletedMidoplansLoaded(midoplans));
  }

  @override
  Future<void> close() {
    //midoplanBlocSubscription.cancel();
    return super.close();
  }
}
