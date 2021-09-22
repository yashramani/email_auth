import 'package:email_auth/Auth/auth_service.dart';
import 'package:email_auth/Widget/Textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                TextFeild(textInputType: TextInputType.text, hintText: 'Email', prefixIcon: Icon(Icons.person), labelText: 'Enter email', obscureText: false, Controller: emailController),
                TextFeild(textInputType: TextInputType.text, hintText: 'Password', prefixIcon: Icon(Icons.admin_panel_settings_outlined), labelText: 'Enter Password', obscureText: true, Controller: passwordController),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: OutlinedButton(
                      onPressed: () async {
                        await authService
                            .signIn(
                                emailController.text, passwordController.text)
                            .then((value) {
                              emailController.clear();
                          passwordController.clear();
                          print('-----------------------------');
                          print('--***--- Data Saved ---***--');
                          print('-----------------------------');
                        });
                      },
                      child: Text('Login')),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  child: OutlineButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
