import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String dialogText;
  const MessageDialog ({super.key, required this.dialogText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: AppColors.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),

      // Title
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
            size: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(width:MediaQuery.of(context).size.width * 0.02),
          Text(
            'ERROR',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      // Content
      content: Text(
        dialogText, 
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.secondaryText,
          fontSize: MediaQuery.of(context).size.height * 0.024,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(AppColors.primary),
            minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.of(context).size.width * 0.5, 0),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'OK',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}