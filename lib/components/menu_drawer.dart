import 'package:ai_chatbot_flask/components/menu_drawer_list_tile.dart';
import 'package:ai_chatbot_flask/pages/ai_settings_page.dart';
import 'package:ai_chatbot_flask/pages/user_settings_page.dart';
import 'package:ai_chatbot_flask/themes/themes.dart';
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
                      right: MediaQuery.of(context).size.width * 0.06),
                  child: Icon(
                    AppIcons.robot,
                    size: MediaQuery.of(context).size.height * 0.1,
                    color: AppColors.descriptionText,
                  ),
                )),
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
                onPressed: () => Navigator.pop(context),
              ),

              // AUTHOR SECTION
              MenuDrawerListTile(
                text: 'About Author',
                icon: AppIcons.raven,
                onPressed: () => Navigator.pop(context),
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
