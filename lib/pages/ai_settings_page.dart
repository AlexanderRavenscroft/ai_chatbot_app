import 'package:ai_chatbot_flask/components/settings_textfield.dart';
import 'package:ai_chatbot_flask/services/picture_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AISettingsPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  AISettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // AppBar
      appBar: AppBar(
        title: Text('AI Settings'),
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
                    'Chatbot name: ',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: SettingsTextfield(
                      isAI: true,
                      hintText: 'eg. My chatbot',
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
                    'Chatbot picture: ',
                    style: TextStyle(
                      color: AppColors.secondaryText,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.primary,
                        ),
                      ),
                      onPressed: () => Provider.of<PictureProvider>(context, listen: false).pickImage(true),
                      child: Text(
                        'Upload your image',
                        style: TextStyle(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
