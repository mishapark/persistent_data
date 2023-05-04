import 'package:flutter/material.dart';
import 'package:users/data/database/database.dart';

class UserArguments {
  final User user;
  final Future<bool> Function(User) updateUser;
  final String creditCardNumb;

  UserArguments(this.user, this.updateUser, this.creditCardNumb);
}

class UserPage extends StatefulWidget {
  const UserPage(
      {Key? key,
      required this.user,
      required this.updateUser,
      required this.creditCardNumb})
      : super(key: key);
  final User user;
  final Future<bool> Function(User) updateUser;
  final String creditCardNumb;

  @override
  State<StatefulWidget> createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  late final User _user;

  @override
  void didChangeDependencies() {
    setState(() {
      _user = widget.user;
    });
    super.didChangeDependencies();
  }

  onGoback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_user.firstName} ${_user.lastName}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(_user.avatar),
          ),
          const SizedBox(
            height: 20,
          ),
          Text('Id : ${_user.id}'),
          Text('Age : ${_user.age}'),
          Text('Phone : ${_user.phoneNumber}'),
          Text('Credit card number : ${widget.creditCardNumb}'),
        ],
      ),
    );
  }
}
