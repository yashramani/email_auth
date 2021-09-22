import 'package:email_auth/Auth/auth_service.dart';
import 'package:email_auth/Widget/Textfeild.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(left: 10, right: 10),child: Form(
          child: Column(
            children: [
              TextFeild(textInputType: TextInputType.text, hintText: 'First Name', prefixIcon: Icon(Icons.person), labelText: 'Enter First Name', obscureText: false, Controller: firstnameController),
              TextFeild(textInputType: TextInputType.text, hintText: 'Last Name', prefixIcon: Icon(Icons.person_outline_rounded), labelText: 'Enter Last Name', obscureText: false, Controller: lastnameController),
              TextFeild(textInputType: TextInputType.phone, hintText: 'Phone', prefixIcon: Icon(Icons.phone), labelText: 'Enter Mobile Number', obscureText: false, Controller: numberController),
              TextFeild(textInputType: TextInputType.text, hintText: 'Email', prefixIcon: Icon(Icons.email_outlined), labelText: 'Enter Email', obscureText: false, Controller: emailController),
              TextFeild(textInputType: TextInputType.text, hintText: 'Password', prefixIcon: Icon(Icons.password), labelText: 'Enter Password', obscureText: false, Controller: passwordController),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 1,
                child: OutlineButton(
                  onPressed: () async {
                    await authService
                        .signInWithEmailAndPassword(
                        emailController.text, passwordController.text)
                        .then((value) {
                      print(
                          'Loginnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn Complete  ${emailController.text}---------- ${passwordController.text}');
                      emailController.clear();
                      passwordController.clear();
                    });
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}
