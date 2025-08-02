import 'package:flutter/material.dart';
import 'package:lamesender/services/auth/auth_service.dart';
import 'package:lamesender/components/my_button.dart';
import 'package:lamesender/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  final void Function()? onTap;

  RegisterPage ({super.key, required this.onTap});

  void register(BuildContext context) {
    //get auth service
    final auth = AuthService();

    //password match -> create user
    if (_passwordController.text == _confirmpasswordController.text){
      try {
        auth.signUpWithEmailPassword(_emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ), 
        );
      }
    }

    //password dont match -> show error to user
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Password does not match!"),
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
            Text("Let's create Account for you", style: TextStyle(color: theme.primary, fontSize: 16,)),
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
            SizedBox(height: 10.0,),
            //Confirm Password TextField
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmpasswordController,
            ),
            SizedBox(height: 25.0,),
            //Register Button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),
            SizedBox(height: 25.0,),
            //Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account? ', style: TextStyle(color: theme.primary),),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login now',style: TextStyle(fontWeight: FontWeight.bold, color: theme.primary),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}