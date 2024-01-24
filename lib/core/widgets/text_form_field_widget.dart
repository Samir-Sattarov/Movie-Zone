import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hint;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final Widget? leadingIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool enabled;
  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.onSubmit,
    this.onChanged,
    this.leadingIcon,
    this.enabled = true,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      enabled: enabled,
      onChanged: (value) => onChanged?.call(value),
      onFieldSubmitted: (value) => onSubmit?.call(value),
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF747E83),
      ),
      decoration: InputDecoration(
        hintText: hint,
        fillColor: const Color(0xff191B1C),
        filled: true,
        prefixIcon: leadingIcon,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h / 2),
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF747E83),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xFF656E72),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xFF656E72),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
