import 'package:flutter/material.dart';
import 'package:lamesender/services/auth/auth_service.dart';
import 'package:lamesender/components/my_button.dart';
import 'package:lamesender/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  
  //Email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //auth
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }
    //catch error
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ), 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(Icons.message, size: 60, color: theme.primary),
            SizedBox(height: 50),
            //Welcome Back message
            Text("Welcome Back you have beenm missed!", style: TextStyle(color: theme.primary, fontSize: 16,)),
            SizedBox(height: 25),
            //Email Textfield
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(height: 10,),
            //Password TextField
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 25.0,),
            //Login Button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),
            SizedBox(height: 25.0,),
            //Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a Member? ', style: TextStyle(color: theme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Register now',style: TextStyle(fontWeight: FontWeight.bold, color: theme.primary),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
