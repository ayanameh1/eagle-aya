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
  required var sizeaware1
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: sizeaware1* 70 / 1080,
        child: TextFormField(
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
              color: black,
              fontFamily: 'Uniform',
              //fontSize:  sizeaware1 * 30 / 1080,
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
        ),
      ),
    );