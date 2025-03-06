class Message {
  final String message;
  final bool isAI;

  Message({
    required this.message,
    required this.isAI,
  });

  // Messages - Displayed in ListView.builder
  static List<Message> messages = [];

  // Initial chatbot Train. Make sure response is in correct format
  static String chatbotInitialTrain =
      'Task: Do not use special characters (e.g., ✨, ❤️, ★, etc.). Avoid using emojis, symbols, or any non-standard text formatting. Avoid chars like `, instead write a full word. Do not use letters diffrent, then standards ones in English Alphabet. If user asks for names involving those letters, write thier non-special version: example: instead of ń - n. Do not format text as code blocks, formulas, or any technical formatting (e.g., code, inline code, or LaTeX-style formulas). If a user requests code or technical formatting, respond with: "I can explain concepts in plain text, but I cannot provide code blocks or formatted formulas. Do not use bold, italics, underlines, or any other text formatting (e.g., bold, italics, etc.). Write all responses in plain text only. Your response cannot exceed 500 chars, Always make sure to edit your response so it ends and have logical sense and structure before exceeding 600 characters. ';
      
  // Messages - in chatbot history to keep conversation context
  static List<Map<String, dynamic>> chatbotMessages = [
    {
      'role': 'developer',
      'content': chatbotInitialTrain,
    }
  ];
}
