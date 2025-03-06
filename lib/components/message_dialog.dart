import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  final String dialogText;
  final String type;
  final TextAlign contentTextAlign;
  const MessageDialog ({super.key, required this.dialogText, this.type = 'error', this.contentTextAlign = TextAlign.center});

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
            (type=='error') ? Icons.error: (type=='success') ? Icons.check_box : Icons.info,
            color: (type=='error') ? Colors.red : (type=='success') ? Colors.green : Colors.blueGrey,
            size: MediaQuery.of(context).size.height * 0.04,
          ),
          SizedBox(width:MediaQuery.of(context).size.width * 0.02),
          Text(
            (type=='error') ? 'ERROR' : (type=='success') ? 'SUCCESS' : 'INFO',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: (type=='error') ? Colors.red : (type=='success') ? Colors.green : Colors.blueGrey,
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      // Content
      content: Text(
        dialogText, 
        textAlign: contentTextAlign,
        softWrap: true,
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
              Size(MediaQuery.of(context).size.width * 0.5,MediaQuery.of(context).size.height * 0.06),
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