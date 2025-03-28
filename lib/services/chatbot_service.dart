import'package:ai_chatbot/components/message_dialog.dart';
import'package:ai_chatbot/models/chatbot_model.dart';
import'package:ai_chatbot/models/message_model.dart';
import'package:ai_chatbot/services/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

bool isLoading = false;

// Default temperature
double chatbotTemperature = 0;

void callOpenAI(String userMessage, BuildContext context) async {
  // Start loading => Show loading indicator
  isLoading = true; 

  // API call link
  var url = Uri.parse('https://api.openai.com/v1/chat/completions');

  // Store API key in .env file
  final apiKey = dotenv.env['apiKey'];

  // Get OpenAIClient instance
  final chatbot = OpenAIClient(
    model: "gpt-4o-mini", 
    maxTokens: 150, 
    temperature: chatbotTemperature, 
    frequencyPenalty: 0, 
    presencePenalty: 0, 
    storeMessages: true,
  );

  // Fetch data
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
    
    // Get decoded data
    final decodedResponse = jsonDecode(response.body);
    final chatbotResponse = decodedResponse['choices'][0]['message']['content'];

    // Send message
    if(context.mounted) {
      Provider.of<ChatProvider>(context, listen: false).sendMessage(chatbotResponse, true);
    }
  } on Exception catch (e) {
    if (context.mounted) {
      showDialog(
        context: context, 
        builder: (context) => MessageDialog(dialogText: e.toString())
      );
    }
  } finally {
    // Stop loading => Show message bubble
    isLoading = false;
  }
}