import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // AppBar
      appBar: AppBar(
        title: Text('User Settings'),
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.secondaryText,
      ),

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Your name: ',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
                Text(
                  'U',
                  style: TextStyle(
                    color: AppColors.secondaryText,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
