import 'package:flutter/material.dart';
import 'package:nomnoman/pages/container_page.dart';
import 'package:nomnoman/providers/auth_provider.dart';
import 'package:nomnoman/providers/drive_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              TextField(decoration: InputDecoration(hintText: "Email")),
              TextField(decoration: InputDecoration(hintText: "Password")),
              TextButton.icon(
                icon: Icon(Icons.login),
                label: Text("Sign in with Google"),
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false)
                      .loginViaGoogle()
                      .then((value) {
                    Provider.of<DriveProvider>(context, listen: false)
                        .fetchAndSetDriveFiles();

                    Navigator.pushReplacementNamed(
                        context, ContainerPage.routeName);
                  });
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
