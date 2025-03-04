import 'dart:io';
import 'package:ai_chatbot_flask/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(bool isAI) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isAI) {
        UserModel.userChatbot.image = File(pickedFile.path);
      } else {
        UserModel.user.image = File(pickedFile.path);
      }
      notifyListeners();
    }
  }
}
