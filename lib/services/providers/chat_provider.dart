import 'package:ai_chatbot/models/message_model.dart';
import 'package:flutter/material.dart';

/// Sends messages and updates message list
class ChatProvider extends ChangeNotifier{
  
  void sendMessage(String messageText, bool isAI) {
    Message message = Message(message: messageText, isAI: isAI);
    Message.messages.add(message);
       Message.chatbotMessages.add(
      {
        'role': isAI ? 'assistant' : 'user',
        'content': messageText,
      }
    );
    notifyListeners();
  }
}