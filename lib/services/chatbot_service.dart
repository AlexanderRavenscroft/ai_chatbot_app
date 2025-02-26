import 'package:ai_chatbot_flask/components/error_dialog.dart';
import 'package:ai_chatbot_flask/models/chatbot_model.dart';
import 'package:ai_chatbot_flask/models/message_model.dart';
import 'package:ai_chatbot_flask/services/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

bool isLoading = false;
int loadingIndex = -1;
void callOpenAI(String userMessage, BuildContext context) async {

  isLoading = true; 
  loadingIndex = Message.messages.length;

  var url = Uri.parse('https://api.openai.com/v1/chat/completions');

  // Store API key in .env file
  final apiKey = dotenv.env['apiKey'];

  // Get OpenAIClient instance
  final chatbot = OpenAIClient(
    model: "gpt-4o-mini", 
    preTrain: "preTrain",
    maxTokens: 150, 
    temperature: 1, 
    frequencyPenalty: 0, 
    presencePenalty: 0, 
    storeMessages: true,
  );

  try {
    var response = await http.post(
      url,
      headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': chatbot.model,
        'max_tokens': chatbot.maxTokens,
        'temperature': chatbot.temperature,
        'frequency_penalty': chatbot.frequencyPenalty, 
        'presence_penalty': chatbot.presencePenalty,
        'store': chatbot.storeMessages,
    
        'messages': Message.chatbotMessages,
      }),
    );
    
    final decodedResponse = jsonDecode(response.body);
    final chatbotResponse = decodedResponse['choices'][0]['message']['content'];
    print(chatbotResponse);
    if(context.mounted) {
      Provider.of<ChatProvider>(context, listen: false).sendMessage(chatbotResponse, true);
    }
  } on Exception catch (e) {
    if (context.mounted) {
      showDialog(
        context: context, 
        builder: (context) => ErrorDialog(dialogText: e.toString())
      );
    }
  } finally {
    // loadingIndex = -1;
    isLoading = false;
  }
}