import 'package:ai_chatbot_flask/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{

void sendMessage(String messageText, bool isAI) {
  Message message = Message(message: messageText, isAI: isAI);
  Message.messages.add(message);
  notifyListeners();
}
}