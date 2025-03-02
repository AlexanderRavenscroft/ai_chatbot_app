import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class MenuDrawerListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const MenuDrawerListTile(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.04,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize:  MediaQuery.of(context).size.height * 0.03,
        ),
      ),
      leading: Icon(icon),
      textColor: AppColors.secondaryText,
      iconColor: AppColors.secondaryText,
      onTap: onPressed,
    );
  }
}
