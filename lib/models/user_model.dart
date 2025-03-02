import 'dart:io';
class UserModel {
  String name;
  File? image;

  UserModel({
    required this.name,
    required this.image,
  });
  static var user = UserModel(name: 'Your name', image: null);
  static var userChatbot = UserModel(name: 'AI chatbot', image: null);
}