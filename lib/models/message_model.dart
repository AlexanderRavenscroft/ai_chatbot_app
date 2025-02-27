class Message{
  final String message;
  final bool isAI;

  Message({
    required this.message,
    required this.isAI,
  });

  // Messages - Displayed in ListView.builder
  static List<Message> messages = [];

  // Messages - in chatbot history to keep conversation context
  static List <Map<String, dynamic>> chatbotMessages = [];
}