import 'package:flutter/material.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_textfield.dart';
import 'package:helloworld/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login method :  
  void login()
  {
    /* fill out auth here */ 

    // navigate to home page 

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => const HomePage(),
       ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo:
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            // Spacing:
            const SizedBox(height: 25),

            // App Slogan:
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            // Email TextField:
            MyTextfield(
              controller: emailController,
              hintText: "EMAIL",
              obsecureText: false,
            ),

            const SizedBox(height: 10),

            // Password TextField:
            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obsecureText: true,
            ),

            const SizedBox(height: 10),

            // Sign-In Button:
            MyButton(
              text: "Sign in",
              onTap: login ,
            ),

            const SizedBox(height: 25),

            // Register Text:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    " Register Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
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

  @override
  void dispose() {
    // Dispose controllers to free memory
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
