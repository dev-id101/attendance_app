import 'dart:ui';

import 'package:attendance_app/components/buttons.dart';
import 'package:attendance_app/components/form_fields.dart';
import 'package:attendance_app/qr_code_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String password = '';

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _login() {
    String email = emailController.text.trim();
    // String password = passwordController.text.trim();

    // Placeholder logic for login authentication
    if (email == 'lecturer@example.com' && password == 'password123') {
      // Navigate to the next page if credentials are correct
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const QrCodePage()));
    } else {
      // Display an error message if credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/sample_image2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 45, top: 100, right: 16, bottom: 150),
                  child: Text(
                    'Class Control',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Login to your account',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          PrimaryTextFormField(
                            labelText: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            prefixWidget: Icon(
                              Icons.email_outlined,
                              color: Colors.grey.shade700,
                            ),
                            hintText: 'example@gmail.com',
                          ),
                          PrimaryTextFormField(
                            labelText: 'Pasword',
                            obscureText: !isPasswordVisible,
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            // onChanged: (value) {
                            //   setState(() {
                            //     password = value;
                            //   });
                            // },
                            prefixWidget: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.grey.shade700,
                            ),
                            suffixWidget: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey.shade700,
                              ),
                              onPressed: togglePasswordVisibility,
                            ),
                            hintText: 'Enter your Password',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(
                            onTap: _login,
                            child: const Text('Login'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
