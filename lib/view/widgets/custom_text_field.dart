import 'package:Blog_app/view/res/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.text,
    required this.textInputType,
    required this.obscure,
    this.validator,
    this.onChange,
    this.inputFormatters,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?)? onChange;

  final TextEditingController textEditingController;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      controller: textEditingController,
      obscureText: obscure,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: text,
        border: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.only(top: 12, left: 10),
        hintStyle: const TextStyle(height: AppSiz.s1),
      ),
    );
  }
}
