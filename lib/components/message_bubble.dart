import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isAI;
  final bool showLoading;
  const MessageBubble({super.key, required this.text, required this.isAI, required this.showLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.025,
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: showLoading 
      ? CircularProgressIndicator()
      : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isAI ? AppColors.neutral : AppColors.primary,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.044,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isAI ? AppColors.secondaryText : AppColors.primaryText,
              fontSize: MediaQuery.of(context).size.height * 0.022,
            ),
          ),
        )
    );
  }
}