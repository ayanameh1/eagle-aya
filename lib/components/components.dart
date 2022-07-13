import 'package:eagle/constants/colors.dart';
import 'package:flutter/material.dart';


Widget defaulTexttFormField(
    {required TextEditingController controller,
      required String label,
      IconData? prefix,
      IconData? suffix,
      bool? obscuretext,
      Function()? onTap,
       Function(String)? onChanged,
      Function()? suffixPressed,
      Function(String)? onSubmit,
      TextInputType? type,
      //String Phone = '',
      String? Function(String?)? validate,
      bool isPassword = false,
      required var sizeaware1}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        height: sizeaware1 * 70 / 1080,
        child: TextFormField(
          keyboardType: type,
          obscureText: isPassword,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
          controller: controller,
          onTap: onTap,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(54),
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: black,
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
          ),
        ),
      ),
    );

// ),
// );
// TextFormField(
// //validator: validate,
// //keyboardType: type,
// //onTap: onTap,

// controller: controller,
// decoration: InputDecoration(
// labelText: label,
// labelStyle: TextStyle(
// color: black,
// fontFamily: 'Uniform',
// ),
// prefixIcon: Icon(
// prefix,
// ),

