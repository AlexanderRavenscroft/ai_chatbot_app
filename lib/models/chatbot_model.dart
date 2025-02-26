class OpenAIClient {
  final String model;
  final String preTrain;

  final int maxTokens;

  final double temperature;
  final double frequencyPenalty;
  final double presencePenalty;

  final bool storeMessages;

  OpenAIClient({
    required this.model,
    required this.preTrain,
    required this.maxTokens,
    required this.temperature,
    required this.frequencyPenalty,
    required this.presencePenalty,
    required this.storeMessages,
  });
}