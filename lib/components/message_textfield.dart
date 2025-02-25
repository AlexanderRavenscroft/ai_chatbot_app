import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageTextfield extends StatelessWidget {
  final TextEditingController controller;
  const MessageTextfield({super.key, required this.controller});

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
       hintText: 'Enter a message..',
       hintStyle: TextStyle(color: AppColors.descriptionText),
     ),
    );
  }
}