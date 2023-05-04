import 'package:flutter/material.dart';
import 'package:users/data/database/database.dart';
import 'package:users/data/secure_storage/storage.dart';
import 'package:users/ui/screens/add_user_page.dart';
import 'package:users/ui/screens/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MyDatabase _database;

  Future<int> _addUser(UsersCompanion user) async {
    return await _database.addUser(user);
  }

  Future<bool> _updateUser(User user) async {
    return await _database.updateUser(user);
  }

  @override
  void initState() {
    super.initState();
    _database = MyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<User>>(
        initialData: const [],
        stream: _database.getUsersStream(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) =>
            snapshot.data == null || snapshot.data!.isEmpty
                ? const Center(
                    child: Text('Users list is empty'),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final user = snapshot.data!.elementAt(index);
                      return ListTile(
                        key: UniqueKey(),
                        title: Text(
                          '${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(user.phoneNumber),
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                            user.avatar,
                          ),
                        ),
                        onTap: () async {
                          final creditCardNumb =
                              await SecureStorage.getCardNumber(user.id);
                          Navigator.of(context).pushNamed(
                            '/user',
                            arguments: UserArguments(
                                user, _updateUser, creditCardNumb ?? ''),
                          );
                        },
                        trailing: Wrap(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                Navigator.of(context).pushNamed('/add_user',
                                    arguments: AddUserArguments(
                                        updateUser: _updateUser, user: user));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await _database.deleteUserById(user.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add_user',
              arguments: AddUserArguments(addUser: _addUser));
        },
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }
}
