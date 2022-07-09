import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({Key? key}) : super(key: key);

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Create new account'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
