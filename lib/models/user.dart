import 'package:flutter/foundation.dart';

/**
 *  @class User
 *  @desc 用户基类，该类的作用为实现用户相关功能以及属性。
 * */
class User {
    // get 访问器：获取id
    String get id => _id;

    // 用户名
    String username;

    // 头像链接
    String photoUrl;

    // 私有属性 _id
    String _id;

    // 是否激活
    bool active;

    // 最后的回复日期
    DateTime lastseen;

    // 构造函数
    User({
        @required String username,
        @required String photoUrl,
        @required bool active,
        @required DateTime lastseen
    });

    // 将用户信息转为JSON格式，用于进程间通信或者数据发送
    toJson() => {
        'username': username,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastseen,
    };

    // 静态方法：通过json对象构造一个user对象
    factory User.fromJson(Map<String, dynamic> json) {
        final user = User(
            username: json['username'],
            photoUrl: json['photo_url'],
            active: json['active'],
            lastseen: json['last_seen'],
        );
        user._id = json['id'];
        return user;
    }
}