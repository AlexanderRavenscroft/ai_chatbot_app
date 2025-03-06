import 'package:ai_chatbot_flask/components/message_dialog.dart';
import 'package:ai_chatbot_flask/components/menu_drawer.dart';
import 'package:ai_chatbot_flask/components/message_list.dart';
import 'package:ai_chatbot_flask/components/message_textfield.dart';
import 'package:ai_chatbot_flask/components/slow_mode_timer.dart';
import 'package:ai_chatbot_flask/models/user_model.dart';
import 'package:ai_chatbot_flask/services/providers/chat_provider.dart';
import 'package:ai_chatbot_flask/services/chatbot_service.dart';
import 'package:ai_chatbot_flask/services/providers/name_provider.dart';
import 'package:ai_chatbot_flask/services/providers/timer_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // AppBar
      appBar: AppBar(
        title: Consumer<NameProvider>(
          builder: (context, nameProvider, child) {
            return Text(UserModel.userChatbot.name);
          }
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.secondaryText,
      ),

      drawer: MenuDrawer(),
      // Body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Message list
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, chatProvider, child) {
                  return MessageList();
                }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              color: AppColors.neutral,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Slow mode timer
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.105,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: SlowModeTimer()
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Message textfield
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: MessageTextfield(
                            hintText: 'Enter a message...',
                            controller: _messageController,
                          ),
                        ),

                        // Send Button
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(AppColors.primary),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_upward_outlined,
                            size: MediaQuery.of(context).size.height * 0.05,
                            color: AppColors.primaryText
                          ),
                          onPressed: () => _sendMessage(context),
                        ),
                      ],
                    ),
                  ),
                  // Desc text
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.11,
                    child: Text(
                      'AI - generated. For refrence only',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.descriptionText,
                        fontSize: MediaQuery.of(context).size.height * 0.018,
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

  // Send message function
  void _sendMessage(BuildContext context) {
    if(!Provider.of<TimerProvider>(context, listen: false).isRunning) {
      if(_messageController.text.isNotEmpty) {
        Provider.of<TimerProvider>(context, listen: false).startTimer();
        Provider.of<ChatProvider>(context, listen: false).sendMessage(_messageController.text, false);
        callOpenAI(_messageController.text, context);
        _messageController.clear();
      }
      else {
        showDialog(
          context: context, 
          builder:(context) => MessageDialog(dialogText: 'Please, enter a message'),
        );
      }
    }
    else {
      showDialog(
        context: context, 
        builder:(context) => MessageDialog(dialogText: 'Please, wait out the timeout'),
      );
    }
  }
}