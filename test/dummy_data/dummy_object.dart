import 'package:suit_media_test_app/data/models/user_model.dart';
import 'package:suit_media_test_app/data/models/user_model_response.dart';
import 'package:suit_media_test_app/domain/entities/user.dart';

UserModel tUserModel = const UserModel(
  id: 1,
  email: 'email',
  firstName: 'firstName',
  lastName: 'lastName',
  avatar: 'avatar',
);

UserModelResponse tUserModelResponse = UserModelResponse(
  page: 1,
  perPage: 1,
  total: 1,
  totalPages: 1,
  data: [tUserModel],
);

User tUser = const User(
  id: 1,
  email: 'email',
  firstName: 'firstName',
  lastName: 'lastName',
  avatar: 'avatar',
);

User tUser2 = const User(
  id: 2,
  email: 'email',
  firstName: 'firstName',
  lastName: 'lastName',
  avatar: 'avatar',
);

List<User> tUserList = [tUser];
List<User> t10UserList = [
  tUser,
  tUser,
  tUser,
  tUser,
  tUser,
  tUser,
  tUser,
  tUser,
  tUser,
  tUser
];
List<User> tExtraUserList = [tUser2];

List<User> tCombinedUserList = [tUser, tUser2];
