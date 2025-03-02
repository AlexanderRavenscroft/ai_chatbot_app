import 'package:ai_chatbot_flask/pages/chat_page.dart';
import 'package:ai_chatbot_flask/services/chat_provider.dart';
import 'package:ai_chatbot_flask/services/picture_provider.dart';
import 'package:ai_chatbot_flask/services/timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await dotenv.load(fileName: ".env"); // Load API key
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => TimerProvider()),
        ChangeNotifierProvider(create: (context) => PictureProvider()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatPage(),
    );
  }
}

