import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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
  void addMiDoPlan(String title) {
    try {
      final midoplan = MidoPlan(id: UniqueKey().toString(), title: title);
      final midoplans = state.midoplans;
      midoplans.add(midoplan);
      emit(MiDoPlanAdded(midoplans));
      emit(MidoplanState(midoplans));
    } catch (e) {
      emit(MiDoPlanError("Error occured!", state.midoplans));
    }
  }
}
