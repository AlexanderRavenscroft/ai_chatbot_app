import 'package:ai_chatbot_flask/components/settings_button.dart';
import 'package:ai_chatbot_flask/components/settings_textfield.dart';
import 'package:ai_chatbot_flask/services/providers/picture_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSettingsPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  UserSettingsPage({super.key});

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
      
      // Settings
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Your name: ',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: SettingsTextfield(
                      isAI: false,
                      hintText: 'eg. John Doe',
                      controller: _messageController,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05
              ),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Your picture: ',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  SettingsButton(
                    text: 'Upload your image', 
                    onPressed: () => Provider.of<PictureProvider>(context, listen: false).pickImage(false),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
