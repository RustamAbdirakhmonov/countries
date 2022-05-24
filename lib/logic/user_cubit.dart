import 'package:bloc/bloc.dart';
import 'package:countries/data/dbHelper.dart';
import 'package:equatable/equatable.dart';

import '../model/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

   singUp(User user) async{
    emit(LoadingState());
    await  DbHelper().insertTask(user);
    emit(SignUpState());
  }



}
