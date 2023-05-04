import 'package:flutter/material.dart';
import 'package:users/ui/screens/my_homepage.dart';
import 'package:users/ui/screens/add_user_page.dart';
import 'package:users/ui/screens/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Users app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Users List'),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/users_list':
            {
              return MaterialPageRoute(
                builder: (context) {
                  return const HomePage(title: 'Users List');
                },
              );
            }
          case '/user':
            {
              final args = settings.arguments as UserArguments;
              return MaterialPageRoute(
                builder: (context) {
                  return UserPage(
                    user: args.user,
                    updateUser: args.updateUser,
                    creditCardNumb: args.creditCardNumb,
                  );
                },
              );
            }
          case '/add_user':
            {
              final args = settings.arguments as AddUserArguments;
              return MaterialPageRoute(
                builder: (context) {
                  return AddUserPage(
                    addUser: args.addUser,
                    updateUser: args.updateUser,
                    user: args.user,
                  );
                },
              );
            }
          default:
            return MaterialPageRoute(
              builder: (context) {
                return const HomePage(title: 'Users List');
              },
            );
        }
      },
    );
  }
}
