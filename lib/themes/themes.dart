import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/// [===================[APP ICONS LICENSE]===================]
/// * Material Design Icons, Copyright (C) Google, Inc
///         Author:    Google
///         License:   Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0)
///         Homepage:  https://design.google.com/icons/
/// * Font Awesome 4, Copyright (C) 2016 by Dave Gandy
///         Author:    Dave Gandy
///         License:   SIL ()
///         Homepage:  http://fortawesome.github.com/Font-Awesome/
/// * RPG Awesome, Copyright (c) 2014, Daniela Howe
///         Author:    Daniela Howe & Ivan Montiel
///         License:   SIL (http://scripts.sil.org/OFL)
///         Homepage:  http://nagoshiashumari.github.io/Rpg-Awesome/
/// * Font Awesome 5, Copyright (C) 2016 by Dave Gandy
///         Author:    Dave Gandy
///         License:   SIL (https://github.com/FortAwesome/Font-Awesome/blob/master/LICENSE.txt)
///         Homepage:  http://fortawesome.github.com/Font-Awesome/
///

class AppColors {
  static const background = Color(0xFFFFFFFF);
  static const primary = Color(0xFF6200EE);
  static const secondary= Color(0xFFF5F5F5);
  static const neutral = Color(0xFFE0E0E0);
  static const primaryText = Color(0xFFFFFFFF);
  static const secondaryText = Color(0xFF000000);
  static const descriptionText = Color(0xFF757575);
}

class AppIcons {
  AppIcons._();
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;
  static const IconData person = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData home = IconData(0xe813, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData settings = IconData(0xe814, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData authors = IconData(0xea03, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData raven = IconData(0xea7a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData github = IconData(0xf09b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData info = IconData(0xf129, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData robot = IconData(0xf544, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
