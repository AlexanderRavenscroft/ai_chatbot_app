import 'package:ai_chatbot_flask/components/message_dialog.dart';
import 'package:ai_chatbot_flask/components/settings_textfield.dart';
import 'package:ai_chatbot_flask/models/message_model.dart';
import 'package:ai_chatbot_flask/services/providers/picture_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AISettingsPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _preTrainController = TextEditingController();
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
                      controller: _nameController,
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
                  horizontal: MediaQuery.of(context).size.width * 0.05),
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
                      onPressed: () =>
                          Provider.of<PictureProvider>(context, listen: false)
                              .pickImage(true),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Custom Training: ',
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),

                        Expanded(
                          child: Center(
                            child: Container(
                              color: AppColors.background,
                              height: MediaQuery.of(context).size.height * 0.26,
                              child: SingleChildScrollView(
                                child: TextField(
                                  controller: _preTrainController,
                                  cursorColor: AppColors.descriptionText,
                                  maxLines: null,
                                  maxLength: 300,
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                    color: AppColors.secondaryText,
                                    fontSize: MediaQuery.of(context).size.height * 0.022,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.transparent),
                                    ),
                                    hintText: 'Enter your custom instructions here...',
                                    hintStyle: TextStyle(color: AppColors.descriptionText),
                                  ),                              
                                ),
                              ),
                            ),
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
                      onPressed: () {
                        Message.chatbotMessages.removeWhere((item) => item['role'] == 'developer');
                          Message.chatbotMessages.add(
      {
        'role': 'developer',
        'content': _preTrainController.text
      }
    );
            showDialog(
          context: context, 
          builder:(context) => MessageDialog(dialogText: 'Training successful'),
        );
        print(Message.chatbotMessages);
                      },
                      child: Text(
                        'Apply Training',
                        style: TextStyle(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01
                      ),
                      child: GestureDetector(
                        onTap: () {
                                  showDialog(
          context: context, 
          builder:(context) => MessageDialog(dialogText: 'Write something here'),
        );
                        },
                        child: Icon(
                          Icons.info_outline,
                          size: MediaQuery.of(context).size.height * 0.04,
                          color: AppColors.primary,
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
