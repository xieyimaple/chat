import 'package:chat/models/user.dart';
import 'package:chat/services/user/user_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rethinkdb_dart/rethinkdb_dart.dart';
import 'helpers.dart';

void main() {
  Rethinkdb r = Rethinkdb();
  Connection connection;
  UserService sut;

  setUp(() async {
    connection = await r.connect(host: '127.0.0.1', port: 28015);
    await createDb(r, connection);
    sut = UserService(r, connection);
  });

  tearDown(() async {
    await cleanDb(r, connection)
  });

  test('創建一個新用戶的數據庫', () async {
    final user = User(
      username: 'test',
      photoUrl: 'url',
      active: true,
      lastseen: DateTime.now()
    );
    final userWithId = await sut.connect(user);
    expect(userWithId.id, isNotEmpty);
  });
}