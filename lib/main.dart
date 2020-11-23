import 'package:flutter/material.dart';
import 'package:logi_app/register_auth/register_user.dart';
import 'package:logi_app/register_auth/register_user_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<RegisterUserState>(
          create: (context) => RegisterUserState()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterUser(),
    );
  }
}
