import 'package:flutter/material.dart';
import 'package:helloworld/pages/login_page.dart';
import 'package:helloworld/pages/registre_page.dart'; 

class LoginOrRegistre extends StatefulWidget {
  const LoginOrRegistre({super.key});

  @override
  State<LoginOrRegistre> createState() => _LoginOrRegistreState();
}

class _LoginOrRegistreState extends State<LoginOrRegistre> {

  //initially , show login page 
  bool showLoginPage = true ; 

  // toggle between login and registre page 
  void togglePages()
  {
    setState(() {
      showLoginPage = !showLoginPage ; 
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage)
    {
      return LoginPage(onTap: togglePages);
    } else {
      return RegistrePage(onTap: togglePages);
    }
  }
}