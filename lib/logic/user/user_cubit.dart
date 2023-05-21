import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_cub/data/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(UserInitial(
          User(id: 'user1', name: "Username1"),
        ));

  User get currentUser {
    return state.user!;
  }      
}
