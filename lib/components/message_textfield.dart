import 'package:ai_chatbot/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const MessageTextfield(
      {super.key, 
      required this.controller,
      required this.hintText
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.descriptionText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        fillColor: AppColors.secondary,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.descriptionText),
      ),
    );
  }
}
