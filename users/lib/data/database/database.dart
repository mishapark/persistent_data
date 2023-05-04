import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  IntColumn get age => integer()();
  TextColumn get avatar => text()();
  TextColumn get phoneNumber => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<User>> getAllUsers() => select(users).get();
  Stream<List<User>> getUsersStream() => select(users).watch();
  Future<int> addUser(user) => into(users).insert(user);
  Future<List<User>> getUserById(int id) =>
      (select(users)..where((u) => u.id.equals(id))).get();
  Stream<User> getUserStreamById(int id) =>
      (select(users)..where((u) => u.id.equals(id))).watchSingle();
  Future<bool> updateUser(User user) => update(users).replace(user);
  Future<int> deleteUserById(int id) =>
      (delete(users)..where((u) => u.id.equals(id))).go();
}
