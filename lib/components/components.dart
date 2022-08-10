import 'package:eagle/components/confi.dart';
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
          validator: validate,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(54),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffffd100),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(54),
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: currentTheme.isdark ? Colors.white : Colors.black,
              fontFamily: 'Uniform',
            ),
            prefixIcon: Icon(
              prefix,
              color: Colors.grey,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffix,
                      color: Colors.grey,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
