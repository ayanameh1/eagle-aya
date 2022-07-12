import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';
Widget defaulTexttFormField({
  required TextEditingController controller,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool? obscuretext,
  Function()? onTap,
  Function(String)? onChanged,
  Function()? suffixPressed,
  Function(String)? onSubmit,
  TextInputType? type,
  String Phone = '',
  required String? Function(String?)? validate,
  bool isPassword = false,
}) =>
    TextFormField(
      validator: validate,
      keyboardType: type,
      onTap: onTap,
      obscureText: isPassword,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Uniform',
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
     Radius.circular(54),),),
        focusColor: Color(0xffffd100),
      ),
    );