part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  UserInitial();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SignUpState extends UserState {
  SignUpState();

  Future<User> getUserData(String id) async {
    List<User> userList=[];
    Future<List<User>> users;
    users= DbHelper().users();
    await users.then((value) {
      if(value!=null){
        value.forEach((element) {userList.add(element);});
      }
    });
    return userList[userList.indexWhere((element) => element.id==id)];
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends UserState {
  LoadingState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
