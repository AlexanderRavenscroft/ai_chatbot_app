import 'package:ai_chatbot_flask/components/message_bubble.dart';
import 'package:ai_chatbot_flask/services/chatbot_service.dart';
import 'package:flutter/material.dart';
import 'package:ai_chatbot_flask/models/message_model.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: Message.messages.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: (Message.messages[index].isAI)
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: MessageBubble(
                  text: Message.messages[index].message,
                  isAI: Message.messages[index].isAI ? true : false,
                ),
              );
            },
          ),
        ),
        (isLoading) ? CircularProgressIndicator() : SizedBox.shrink(),
      ],
    );
  }
}
