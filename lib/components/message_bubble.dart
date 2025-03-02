import 'package:ai_chatbot_flask/models/user_model.dart';
import 'package:ai_chatbot_flask/services/picture_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isAI;
  const MessageBubble({super.key, required this.text, required this.isAI});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment:
        isAI ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Align(
            alignment: isAI?  Alignment.topLeft : Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
              child: Consumer<PictureProvider>(
                builder: (context, pictureProvider, child) {
                  return Text(
                    isAI ? UserModel.userChatbot.name : UserModel.user.name,
                    style: TextStyle(
                      color: AppColors.descriptionText,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    )
                  );
                }
              ),
            )
          ),
          Container(
            margin: EdgeInsets.only(
              left: isAI ? MediaQuery.of(context).size.width * 0.075 : 0,
              right: isAI ? 0 : MediaQuery.of(context).size.width * 0.075,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.86,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: isAI ? Radius.zero : Radius.circular(15),
                bottomRight: isAI ? Radius.circular(15) : Radius.zero,
              ),
              color: isAI ? AppColors.neutral : AppColors.primary,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isAI ? AppColors.secondaryText : AppColors.primaryText,
                fontSize: MediaQuery.of(context).size.height * 0.022,
              ),
              softWrap: true,
            ),
          ),
          Consumer<PictureProvider>(builder: (context, pictureProvider, child) {
            return CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: MediaQuery.of(context).size.height * 0.022,
              backgroundImage: isAI
                  ? (UserModel.userChatbot.image != null
                      ? FileImage(UserModel.userChatbot.image!)
                      : null)
                  : (UserModel.user.image != null
                      ? FileImage(UserModel.user.image!)
                      : null),
              child: (isAI && UserModel.userChatbot.image == null) ||
                      (!isAI && UserModel.user.image == null)
                  ? Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: AppColors.descriptionText,
                    )
                  : null,
            );
          }),
        ],
      ),
    );
  }
}
