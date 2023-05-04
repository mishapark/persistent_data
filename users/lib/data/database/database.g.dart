// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  @override
  late final GeneratedColumn<String> avatar = GeneratedColumn<String>(
      'avatar', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, firstName, lastName, age, avatar, phoneNumber];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      avatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String avatar;
  final String phoneNumber;
  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.avatar,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['age'] = Variable<int>(age);
    map['avatar'] = Variable<String>(avatar);
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      age: Value(age),
      avatar: Value(avatar),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      age: serializer.fromJson<int>(json['age']),
      avatar: serializer.fromJson<String>(json['avatar']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'age': serializer.toJson<int>(age),
      'avatar': serializer.toJson<String>(avatar),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  User copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          int? age,
          String? avatar,
          String? phoneNumber}) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        age: age ?? this.age,
        avatar: avatar ?? this.avatar,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, firstName, lastName, age, avatar, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.age == this.age &&
          other.avatar == this.avatar &&
          other.phoneNumber == this.phoneNumber);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<int> age;
  final Value<String> avatar;
  final Value<String> phoneNumber;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.age = const Value.absent(),
    this.avatar = const Value.absent(),
    this.phoneNumber = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required int age,
    required String avatar,
    required String phoneNumber,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        age = Value(age),
        avatar = Value(avatar),
        phoneNumber = Value(phoneNumber);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<int>? age,
    Expression<String>? avatar,
    Expression<String>? phoneNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (age != null) 'age': age,
      if (avatar != null) 'avatar': avatar,
      if (phoneNumber != null) 'phone_number': phoneNumber,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<int>? age,
      Value<String>? avatar,
      Value<String>? phoneNumber}) {
    return UsersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('age: $age, ')
          ..write('avatar: $avatar, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
