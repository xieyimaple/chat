import 'package:chat/models/user.dart';

/**
 *  @class User
 *  @desc 用户基类，该类的作用为实现用户相关功能以及属性。
 * */
abstract class IUserService {
  Future<User> connect(User user);
  Future<List<User>> online();
  Future<void> disconnect(User user);
}