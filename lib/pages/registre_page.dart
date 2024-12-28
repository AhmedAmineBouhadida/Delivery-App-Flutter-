import 'package:flutter/material.dart';
import 'package:helloworld/components/my_button.dart';
import 'package:helloworld/components/my_textfield.dart'; 

class RegistrePage extends StatefulWidget {

  final void Function()? onTap; 

  const RegistrePage({super.key , required this.onTap});

  @override
  State<RegistrePage> createState() => _RegistrePageState();
}

class _RegistrePageState extends State<RegistrePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
              "Let's Create an account",
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

                        // Password TextField:
            MyTextfield(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obsecureText: true,
            ),

            const SizedBox(height: 10),

            // Sign-up Button:
            MyButton(
              text: "Sign up",
              onTap: () {
                // Handle sign-in logic here
              },
            ),

            const SizedBox(height: 25),

            //  Already have an account ? Login here :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Alerady have an account ?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    " Login Now",
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
}