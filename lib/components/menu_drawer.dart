import 'package:ai_chatbot/components/menu_drawer_list_tile.dart';
import 'package:ai_chatbot/components/message_dialog.dart';
import 'package:ai_chatbot/pages/ai_settings_page.dart';
import 'package:ai_chatbot/pages/user_settings_page.dart';
import 'package:ai_chatbot/themes/themes.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondary,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // DRAWER ICON
              DrawerHeader(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: Icon(
                      AppIcons.robot,
                      size: MediaQuery.of(context).size.height * 0.1,
                      color: AppColors.descriptionText,
                    ),
                  ),
                ),
              ),

              // HOME
              MenuDrawerListTile(
                text: 'Home',
                icon: AppIcons.home,
                onPressed: () => Navigator.pop(context),
              ),

              // AI SETTINGS
              MenuDrawerListTile(
                text: 'AI Settings',
                icon: AppIcons.settings,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AISettingsPage(),
                    ),
                  );
                },
              ),

              // APP INFO
              MenuDrawerListTile(
                text: 'App Info',
                icon: AppIcons.info,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => MessageDialog(
                      dialogText:
                          'Simple AI chatbot app using an OpenAI gpt4o-mini model.\nThis app wont work unless you provide an API key in the .env file. ',
                      type: 'info',
                    ),
                  );
                },
              ),

              // AUTHOR SECTION
              MenuDrawerListTile(
                text: 'About Author',
                icon: AppIcons.raven,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => MessageDialog(
                      dialogText: "Hi! I am Alexander Ravenscroft, a passionate Flutter mobile app developer from Poland.\nI am 19 years old and have been programming for over three years. While I’m still at the beginning of my journey in mobile app development, I love building elegant, cross-platform applications that provide seamless user experiences. I enjoy taking on new challenges and turning ideas into functional apps.\nWhen I’m not coding, you’ll probably find me exploring UI/UX design trends, hitting the gym or sailing.\nLet’s connect and create something amazing together!!",
                      type: 'info',
                    ),
                  );
                },
              ),
            ],
          ),

          // USER SETTINGS
          MenuDrawerListTile(
            text: 'Your Profile',
            icon: AppIcons.person,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserSettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
