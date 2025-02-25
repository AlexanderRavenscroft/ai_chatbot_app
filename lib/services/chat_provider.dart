import 'package:ai_chatbot_flask/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{

void sendMessage(String messageText) {
  Message message = Message(message: messageText, isAI: false);
  Message.messages.add(message);
  notifyListeners();
}
}