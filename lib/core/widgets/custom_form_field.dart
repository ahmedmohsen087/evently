import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final Widget prefixIcon;
  final bool isPasswordField;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.isPasswordField = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: 1,
      obscureText: widget.isPasswordField ? _isObscured : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: widget.prefixIcon,
        prefixStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPasswordField
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: Icon(
                  _isObscured ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.gray,
                ),
              )
            : null,
        suffixStyle: const TextStyle(
          color: AppColors.gray,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.gray,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.gray,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
