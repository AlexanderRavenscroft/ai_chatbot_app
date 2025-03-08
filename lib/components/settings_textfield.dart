import 'package:ai_chatbot/services/providers/name_provider.dart';
import 'package:ai_chatbot/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isAI;

  const SettingsTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isAI,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.secondaryText,
      maxLength: 14,
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.descriptionText),
      ),
      style: TextStyle(
        color: AppColors.secondaryText,
        fontSize: MediaQuery.of(context).size.height * 0.025,
      ),
      onChanged: (value) => Provider.of<NameProvider>(
        context,
        listen: false,
      ).refreshName(isAI, value),
    );
  }
}
