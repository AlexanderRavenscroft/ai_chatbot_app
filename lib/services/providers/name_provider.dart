import 'package:ai_chatbot_flask/models/user_model.dart';
import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier {
  void refreshName(bool isAI, value) {
    if (isAI) {
      UserModel.userChatbot.name = value;
    } else {
      UserModel.user.name = value;
    }
    notifyListeners();
  }
}
