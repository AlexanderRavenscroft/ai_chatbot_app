import 'package:ai_chatbot/services/providers/timer_provider.dart';
import 'package:ai_chatbot/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlowModeTimer extends StatefulWidget {
  const SlowModeTimer({super.key});

  @override
  State<SlowModeTimer> createState() => SlowModeTimerState();
}

class SlowModeTimerState extends State<SlowModeTimer> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return (timerProvider.isRunning)
          ? Text(
              '0:${context.watch<TimerProvider>().seconds.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.descriptionText,
                fontSize: MediaQuery.of(context).size.height * 0.024,
              ),
            )
          : SizedBox.shrink();
      },
    );
  }
}
