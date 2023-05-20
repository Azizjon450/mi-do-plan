import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_cub/logic/cubit/user_cubit.dart';
import '/data/models/midoplan.dart';

part 'midoplan_state.dart';

class MidoplanCubit extends Cubit<MidoplanState> {
  final UserCubit userCubit;
  MidoplanCubit({required this.userCubit})
      : super(MidoplanInitial([
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go Home',
            isDone: false,
            userId: 'user1',
          ),
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go Learning',
            isDone: true,
            userId: 'user1',
          ),
          MidoPlan(
            id: UniqueKey().toString(),
            title: 'Go School',
            isDone: false,
            userId: 'user2',
          ),
        ]));

  void getMidoplans() {
    //should filter by userId
    final user = userCubit.currentUser;
    final midoplans = state.midoplans!.where((midoplan) => midoplan.userId == user.id).toList();
    emit(MidoplanState(midoplans: midoplans));
  }      

  void addMidoPlan(String title) {
    final user = userCubit.currentUser;
    try {
      final midoplan = MidoPlan(id: UniqueKey().toString(), title: title, userId: user.id);
      final midoplans = [...state.midoplans!, midoplan];
      emit(MidoPlanAdded());
      emit(MidoplanState(midoplans: midoplans));
    } catch (e) {
      emit(MidoPlanError("Error occured!"));
    }
  }

  void editMidoPlan(String id, String title) {
    try {
      final midoplans = state.midoplans!.map((t) {
        if (t.id == id) {
          return MidoPlan(id: id, title: title, isDone: t.isDone, userId: t.id);
        }
        return t;
      }).toList();
      emit(MidoplanEdited());
      emit(MidoplanState(midoplans: midoplans));
    } catch (e) {
      emit(const MidoPlanError("Error occured!"));
    }
  }

  void midoplanToggle(String id) {
    final midoplans = state.midoplans!.map((midoplan) {
      if (midoplan.id == id) {
        return MidoPlan(
            id: id, title: midoplan.title, isDone: !midoplan.isDone, userId: midoplan.userId);
      }
      return midoplan;
    }).toList();
    emit(MidoplanToggled());
    emit(MidoplanState(midoplans: midoplans));
  }

  void midoplanREmove(String id) {
    final midoplans = state.midoplans;
    midoplans!.removeWhere((midoplan) => midoplan.id == id);
    emit(MidoplanDeleted());
    emit(MidoplanState(midoplans: midoplans));
  }

  List<MidoPlan> searchMidoPlans(String title) {
    return state.midoplans!
        .where(
          (midoplan) => midoplan.title.toLowerCase().contains(
                title.toLowerCase(),
              ),
        )
        .toList();
  }
}
