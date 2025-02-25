import 'package:ai_chatbot_flask/components/error_dialog.dart';
import 'package:ai_chatbot_flask/components/message_list.dart';
import 'package:ai_chatbot_flask/components/message_textfield.dart';
import 'package:ai_chatbot_flask/services/chat_provider.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

 final TextEditingController _messageController = TextEditingController();
  @override
  
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('AI Chatbot'),
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        foregroundColor: AppColors.secondaryText,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, chatProvider, child) {
                  return MessageList();
                }
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
             color: AppColors.neutral,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: MessageTextfield(
                      controller: _messageController,
                    ),
                  ),

                  IconButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(AppColors.primary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ),
                     icon: Icon(
                      Icons.arrow_upward_outlined,
                      size: MediaQuery.of(context).size.height * 0.05,
                       color: AppColors.primaryText
                    ),
                    onPressed: () => _sendMessage(context),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    ) ;
  }
  void _sendMessage(BuildContext context) {
    if(_messageController.text.isNotEmpty) {
      Provider.of<ChatProvider>(context, listen: false).sendMessage(_messageController.text);      _messageController.clear();
    }
    else {
      showDialog(
        context: context, 
        builder:(context) =>  ErrorDialog (dialogText: 'Please, enter a message'),
      );
    }
  }
}











class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  CounterButtonState createState() => CounterButtonState();
}

class CounterButtonState extends State<CounterButton> {
  String message = 'Wiadomosc 1';
  int usrInput = 8;

  // Future<void> _incrementCounter() async {
  //   try {
  //     final response = await http.get(Uri.parse('http://192.168.0.17:50162/increment?usrInput=$usrInput'));
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         message = response.body;
  //       });
  //     }
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}