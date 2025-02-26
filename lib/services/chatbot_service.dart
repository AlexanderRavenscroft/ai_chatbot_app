import 'package:ai_chatbot_flask/models/chatbot_model.dart';
import 'package:ai_chatbot_flask/services/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

void callOpenAI(String userMessage, BuildContext context) async {
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

      'messages': [
        {'role': 'user', 
        'content': userMessage}
      ],
    }),
  );
  final decodedResponse = jsonDecode(response.body);
  final chatbotResponse = decodedResponse['choices'][0]['message']['content'];
  if(context.mounted) {
    Provider.of<ChatProvider>(context, listen: false).sendMessage(chatbotResponse, true);
  }
}