import 'dart:math';
import 'package:todo_app/auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Sign Up")),
      body: Container(
        child: Column(
          children: [
            Column(children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        createUser(nameController.text, emailController.text,
                            passwordController.text);
                        //Navigation
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text("Sign Up")),
                  SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("login"))
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
