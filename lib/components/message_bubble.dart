import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isAI;
  const MessageBubble({super.key, required this.text, required this.isAI});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.025,
        vertical: MediaQuery.of(context).size.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: isAI ? MediaQuery.of(context).size.width * 0.02 : 0,
              right: isAI ? 0 : MediaQuery.of(context).size.width * 0.02,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isAI ? AppColors.neutral : AppColors.primary,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isAI ? AppColors.secondaryText : AppColors.primaryText,
                fontSize: MediaQuery.of(context).size.height * 0.022,
              ),
            ),
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.02,
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
