import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '/data/models/midoplan.dart';

part 'midoplan_state.dart';

class MidoplanCubit extends Cubit<MidoplanState> {
  MidoplanCubit()
      : super(MidoplanInitial([
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go Home',
            isDone: false,
          ),
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go Learning',
            isDone: true,
          ),
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go School',
            isDone: false,
          ),
        ]));
  void addMidoPlan(String title) {
    try {
      final midoplanT = MidoPlan(id: UniqueKey().toString(), title: title);
      final midoplans = state.midoplans;
      midoplans.add(midoplanT);
      emit(MidoPlanAdded(midoplans));
      emit(MidoplanState(midoplans));
    } catch (e) {
      emit(MidoPlanError("Error occured!", state.midoplans));
    }
  }

  void editMidoPlan(MidoPlan midoplanT) {
    try {
      final midoplans = state.midoplans;
      final index = midoplans.indexWhere((m) => m.id == midoplanT.id);
      midoplans.add(midoplanT);
      emit(MidoPlanAdded(midoplans));
      emit(MidoplanState(midoplans));
    } catch (e) {
      emit(MidoPlanError("Error occured!", state.midoplans));
    }
  }

  void midoplanToggle(String id) {
    final midoplans = state.midoplans;
    final index = midoplans.indexWhere((m) => m.id == id);
    midoplans[index].isDone = !midoplans[index].isDone;
    emit(MidoplanToggled(midoplans));
    emit(MidoplanState(midoplans));
  }
}
