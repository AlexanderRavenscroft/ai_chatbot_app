import 'package:ai_chatbot_flask/components/message_dialog.dart';
import 'package:ai_chatbot_flask/components/settings_slider.dart';
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
      resizeToAvoidBottomInset: false, // Prevent keyboard overflow
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
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
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
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.022,
                                  ),
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                    hintText:
                                        'Enter your custom instructions here...',
                                    hintStyle: TextStyle(
                                        color: AppColors.descriptionText),
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
                              if (_preTrainController.text.isNotEmpty) {
                                Message.chatbotMessages.removeWhere(
                                    (item) => item['role'] == 'developer');
                                Message.chatbotMessages.add({
                                  'role': 'developer',
                                  'content': _preTrainController.text
                                });
                                showDialog(
                                  context: context,
                                  builder: (context) => MessageDialog(
                                    dialogText: 'Training successful',
                                    type: 'success',
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => MessageDialog(
                                    dialogText: 'Please, type something',
                                  ),
                                );
                              }
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => MessageDialog(
                              dialogText:
                                  'This prompt gives the chatbot a main rule to follow, shaping how it responds.\nExample: You are a pirate, and you must say "arrr" every third word in your responses.',
                              type: 'info',
                            ),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Center(
                    child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Text(
                          'Chatbot creativity: ',
                        
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                        Expanded(child: SettingsSlider()),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.01),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => MessageDialog(
                                dialogText:
                                    'If you want more creative and diverse responses, try increasing the temperature. Lower values keep things focused and precise, while higher values make the model more adventurous and unpredictable!\nVery Focused – Highly deterministic, repeats the most probable response.\nBalanced – A mix of predictability and creativity, with some variation.\nCreative – More diverse and open-ended responses, slightly unpredictable.\nHighly Inventive – Generates unique and surprising responses, less structured.\nWild & Unpredictable – Maximum randomness, responses may be chaotic or unexpected.',
                                type: 'info',
                                contentTextAlign: TextAlign.justify,
                              ),
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
                )))
          ],
        ),
      ),
    );
  }
}
