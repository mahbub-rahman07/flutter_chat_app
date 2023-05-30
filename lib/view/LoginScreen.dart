import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../state/LoginState/LoginState.dart';



class LoginScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final LoginState counterNotifier = ref.watch(loginProvider.notifier);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('images/logo.png',)),
                const SizedBox(height: 30),
                const Text(
                  'Let\'s sign you in!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome back! \nYou\'ve been missed!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(), hintText: "enter email"),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  validator: (value) {
                    if (value != null && value.isNotEmpty && value.length < 5) {
                      return "Your username should be more than 5 characters";
                    } else if (value != null && value.isEmpty) {
                      return "Please type your username";
                    }
                  },
                  controller: passwordController,
                  obscureText:  ref.watch(loginProvider),
                  decoration: InputDecoration(
                      suffixIcon:
                      IconButton(
                        icon:  ref.watch(loginProvider)
                            ? const Icon(Icons.visibility_off_sharp)
                            : const Icon(Icons.visibility_sharp),
                        onPressed: () {
                          counterNotifier.toggle();
                        },
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "enter password"),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat',
                          arguments: '${userNameController.text}'
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
