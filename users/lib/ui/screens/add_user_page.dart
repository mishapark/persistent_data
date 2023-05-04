import 'package:flutter/material.dart';
import 'package:users/data/secure_storage/storage.dart';
import 'package:users/data/database/database.dart';
import 'package:users/ui/widgets/custom_text_field.dart';

class AddUserArguments {
  final Future<int> Function(UsersCompanion)? addUser;
  final Future<bool> Function(User)? updateUser;
  final User? user;

  AddUserArguments({this.addUser, this.updateUser, this.user});
}

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key, this.addUser, this.updateUser, this.user})
      : super(key: key);
  final Future<int> Function(UsersCompanion)? addUser;
  final Future<bool> Function(User)? updateUser;
  final User? user;

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  bool isLoading = false;

  final _lastNameFieldController = TextEditingController();
  final _firstNameFieldController = TextEditingController();
  final _ageFieldController = TextEditingController();
  final _phoneFieldController = TextEditingController();
  final _avatarFieldController = TextEditingController();
  final _creditCardNumberFieldController = TextEditingController();

  @override
  void initState() {
    if (widget.user != null) {
      _firstNameFieldController.text = widget.user!.firstName;
      _lastNameFieldController.text = widget.user!.lastName;
      _ageFieldController.text = widget.user!.age.toString();
      _phoneFieldController.text = widget.user!.phoneNumber;
      _avatarFieldController.text = widget.user!.avatar;
      SecureStorage.getCardNumber(widget.user!.id)
          .then((value) => _creditCardNumberFieldController.text = value ?? '');
    }
    super.initState();
  }

  Future<void> _addUser() async {
    String firstName = _firstNameFieldController.text;
    String lastName = _lastNameFieldController.text;
    String age = _ageFieldController.text;
    String phoneNumber = _phoneFieldController.text;
    String avatar = _avatarFieldController.text;
    String creditCardNumber = _creditCardNumberFieldController.text;
    if (widget.addUser != null) {
      final id = await widget.addUser!(
        UsersCompanion.insert(
          firstName: firstName,
          lastName: lastName,
          age: int.parse(age),
          phoneNumber: phoneNumber,
          avatar: avatar,
        ),
      );
      await SecureStorage.saveCardNumber(id, creditCardNumber);
    } else if (widget.updateUser != null && widget.user != null) {
      await widget.updateUser!(
        User(
          firstName: firstName,
          lastName: lastName,
          age: int.parse(age),
          phoneNumber: phoneNumber,
          avatar: avatar,
          id: widget.user!.id,
        ),
      );
      await SecureStorage.saveCardNumber(widget.user!.id, creditCardNumber);
    }
  }

  Widget pageContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: _firstNameFieldController,
              label: "First name",
            ),
            CustomTextField(
              controller: _lastNameFieldController,
              label: "Last name",
            ),
            CustomTextField(
              controller: _ageFieldController,
              label: "Age",
            ),
            CustomTextField(
              controller: _phoneFieldController,
              label: "Phone Number",
            ),
            CustomTextField(
              controller: _avatarFieldController,
              label: "Avatar link",
            ),
            CustomTextField(
              controller: _creditCardNumberFieldController,
              label: "Credit card number",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _addUser();
                          Navigator.pop(context);
                        },
                        child: const Text("Add User"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add user"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : pageContent(),
    );
  }
}
