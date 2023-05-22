import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:to_do_cub/data/models/midoplan.dart';
import 'package:to_do_cub/logic/blocs/user/user_bloc.dart';

part 'midoplan_event.dart';
part 'midoplan_state.dart';

class MidoplanBloc extends Bloc<MidoplanEvent, MidoplanState> {
  final UserBloc userBloc;

  MidoplanBloc(this.userBloc)
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
        ])) {
    on<LoadMidoplanEvent>(_getMidoplans);
    on<AddNewMidoplanEvent>(_addMidoPlan);
    on<EditMidoplanEvent>(_editMidoPlan);
    on<ToggleMidoplanEvent>(_midoplanToggle);
    
  }

  void _getMidoplans(LoadMidoplanEvent event, Emitter<MidoplanState> emit) {
    //should filter by userId
    final user = userBloc.currentUser;
    final midoplans = state.midoplans!.where((midoplan) => midoplan.userId == user.id).toList();
    emit(MidoplanLoaded(midoplans));
  }

  void _addMidoPlan(AddNewMidoplanEvent event, Emitter<MidoplanState> emit) {
    final user = userBloc.currentUser;
    try {
      final midoplan =
          MidoPlan(id: UniqueKey().toString(), title: event.title, userId: user.id);
      final midoplans = [...state.midoplans!, midoplan];
      emit(MidoPlanAdded());
      emit(MidoplanLoaded(midoplans));
    } catch (e) {
      emit(MidoPlanError("Error occured!"));
    }
  }

  void _editMidoPlan(EditMidoplanEvent event, Emitter<MidoplanState> emit) {
    try {
      final midoplans = state.midoplans!.map((t) {
        if (t.id == event.id) {
          return MidoPlan(id: event.id, title: event.title, isDone: t.isDone, userId: t.id);
        }
        return t;
      }).toList();
      emit(MidoplanEdited());
      emit(MidoplanLoaded(midoplans));
    } catch (e) {
      emit(const MidoPlanError("Error occured!"));
    }
  }

  void _midoplanToggle(ToggleMidoplanEvent event, Emitter<MidoplanState> emit) {
    final midoplans = state.midoplans!.map((midoplan) {
      if (midoplan.id == event.id) {
        return MidoPlan(
            id: event.id,
            title: midoplan.title,
            isDone: !midoplan.isDone,
            userId: midoplan.userId);
      }
      return midoplan;
    }).toList();
    emit(MidoplanToggled());
    emit(MidoplanLoaded(midoplans));
  }

  void _midoplanRemove(DeleteMidoplanEvent event, Emitter<MidoplanState> emit) {
    final midoplans = state.midoplans;
    midoplans!.removeWhere((midoplan) => midoplan.id == event.id);
    emit(MidoplanDeleted());
    emit(MidoplanLoaded(midoplans));
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
