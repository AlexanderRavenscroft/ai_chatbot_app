import 'package:ai_chatbot/services/chatbot_service.dart';
import 'package:ai_chatbot/themes/themes.dart';
import 'package:flutter/material.dart';

class SettingsSlider extends StatefulWidget {
  const SettingsSlider({super.key});

  @override
  State<SettingsSlider> createState() => _SettingsSliderState();
}

class _SettingsSliderState extends State<SettingsSlider> {
  String label = 'Very Focused';

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: AppColors.primary,
        thumbColor:  AppColors.primary,
        inactiveTrackColor: AppColors.neutral,
        trackHeight: MediaQuery.of(context).size.height * 0.03,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: MediaQuery.of(context).size.height * 0.022
        ),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      child: Slider(
        value: chatbotTemperature,
        onChanged: (value) {
          setState(() => chatbotTemperature = value);
          _getLabel(chatbotTemperature);
        },
        min: 0,
        max: 2,
        label: label,
        divisions: 10,
      ),
    );
  }
  
  String _getLabel(chatbotTemperature) {
    switch (chatbotTemperature) {
      case 0 || 0.2 || 0.4:
        label = 'Very Focused';
      break;

      case  0.6 || 0.8:
        label = 'Balanced';
      break;

      case  1 || 1.2:
        label = 'Creative';
      break;

      case  1.4 || 1.6:
        label = 'Highly Inventive';
      break;

      case  1.8 || 2:
        label = 'Wild & Unpredictable';
      break;

      default:
        label = 'Very Focused';
      break;
    }
    return label;
  }
}