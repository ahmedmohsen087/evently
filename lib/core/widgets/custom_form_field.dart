import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String labelText;
  Widget prefixIcon;
  Widget? suffixIcon;

  CustomFormField(
      {super.key,
      required this.labelText,
      required this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
            color: AppColors.gray, fontSize: 16, fontWeight: FontWeight.w500),
        prefixIcon: prefixIcon,
        prefixStyle: TextStyle(
            color: AppColors.gray, fontSize: 16, fontWeight: FontWeight.w500),
        suffixIcon: suffixIcon,
        suffixStyle: TextStyle(
            color: AppColors.gray, fontSize: 16, fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.gray,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.gray,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
