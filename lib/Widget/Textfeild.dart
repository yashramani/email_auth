import 'package:flutter/material.dart';

class TextFeild extends StatelessWidget {

  final TextInputType textInputType;
  final String hintText;
  final Widget prefixIcon;
  final String labelText;
  final bool obscureText;
  final TextEditingController Controller;

  const TextFeild({Key? key, required this.textInputType, required this.hintText, required this.prefixIcon,required this.labelText,required this.obscureText,required this.Controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: Controller,
      decoration: InputDecoration(
        icon: prefixIcon,
        hintText: hintText,
        labelText: labelText
      ),
    );
  }
}
