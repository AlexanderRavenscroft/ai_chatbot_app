class Message{
  final String message;
  final bool isAI;

  Message({
    required this.message,
    required this.isAI,
  });

  static List<Message> messages = [];
}