import 'package:flutter/material.dart';

import 'app_text_style.dart';
import 'app_theme.dart';

class AppThemeBright extends AppTheme {
  AppTextStyle get textStyle => AppTextStyle.share;

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: background3,
      backgroundColor: background3,
      primaryColor: primary,
      dialogBackgroundColor: grey90,
      fontFamily: 'Roboto-Regular',
      appBarTheme: _buildAppBarTheme,
      bottomAppBarTheme: _buildBottomAppBarTheme,
      dialogTheme: _buildDialogTheme);

  // appbar
  AppBarTheme get _buildAppBarTheme => AppBarTheme(
        color: background2,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: grey0),
        // textTheme: TextTheme(),
        titleTextStyle:
            TextStyle(color: grey0, fontSize: 16, fontFamily: 'Roboto-Regular'),
      );

  // bottom appbar
  BottomAppBarTheme get _buildBottomAppBarTheme =>
      BottomAppBarTheme(elevation: 0, color: background2);

  // dialog
  DialogTheme get _buildDialogTheme => DialogTheme(elevation: 0);

  @override
  Color get background0 => Color(0xFF000000);

  @override
  Color get background1 => Color(0xFF161818);

  @override
  Color get background2 => Color(0xFF212222);

  @override
  Color get background3 => Color(0xFF292C2B);

  @override
  Color get blue10 => Color(0xFFE8F2FF);

  @override
  Color get blue20 => Color(0xFFE8F2FF);

  @override
  Color get blue50 => Color(0xFF25D2EA);

  @override
  Color get blue60 => Color(0xFF0086D1);

  @override
  LinearGradient get gradientBlue => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff30B9F3),
          Color(0xFF0A2D41),
        ],
      );

  @override
  LinearGradient get gradientGreen => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff00D387),
          Color(0xFF0A4129),
        ],
      );

  @override
  LinearGradient get gradientRed => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xffFF4141),
          Color(0xFF470A0A),
        ],
      );

  @override
  LinearGradient get gradientViolet => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xffDE20DF),
          Color(0xFF3C0A41),
        ],
      );

  @override
  LinearGradient get gradientYellow => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xffEDE51D),
          Color(0xFF413B0A),
        ],
      );

  @override
  Color get grey0 => Color(0xFFFFFFFF);

  @override
  Color get grey10 => Color(0xFFE1E1E3);

  @override
  Color get grey20 => Color(0xFFD2D2D6);

  @override
  Color get grey30 => Color(0xFFBCC3C3);

  @override
  Color get grey40 => Color(0xFFA4AFAC);

  @override
  Color get grey50 => Color(0xFF545F5B);

  @override
  Color get grey60 => Color(0xFF38433E);

  @override
  Color get grey70 => Color(0xFF232A28);

  @override
  Color get grey80 => Color(0xFF1B211F);

  @override
  Color get grey90 => Color(0xFF131615);

  @override
  Color get grey100 => Color(0xFF0E100F);

  @override
  Color get green10 => Color(0xFFEFFFF1);

  @override
  Color get green20 => Color(0xFFBEF2C0);

  @override
  Color get green50 => Color(0xFF0FBD6A);

  @override
  Color get green60 => Color(0xFF109B58);

  @override
  Color get primary => Color(0xFF17E9B7);

  @override
  Color get red10 => Color(0xFFFFEDE9);

  @override
  Color get red20 => Color(0xFFFFC8C5);

  @override
  Color get red50 => Color(0xFFED4B40);

  @override
  Color get red60 => Color(0xFFC73F37);

  @override
  Color get secondary => Color(0xFF2C4F42);

  @override
  Color get violet10 => Color(0xFFFEE3FF);

  @override
  Color get violet20 => Color(0xFFFFC5FF);

  @override
  Color get violet50 => Color(0xFFDE20DF);

  @override
  Color get violet60 => Color(0xFFAE0CAF);

  @override
  Color get yellow10 => Color(0xFFFFFBD9);

  @override
  Color get yellow20 => Color(0xFFFFFBA0);

  @override
  Color get yellow50 => Color(0xFFEDE51D);

  @override
  Color get yellow60 => Color(0xFFDFC900);

  @override
  Color get textColorBlue => Color(0xFF10C6FF);

  @override
  Color get textColorGreen => Color(0xFF00FF47);

  @override
  Color get textColorRed => Color(0xFFFF2424);

  @override
  Color get textColorViolet => Color(0xFFFF00FF);

  @override
  Color get textColorYellow => Color(0xFFFFF500);

  @override
  Color get white => Color(0xFFFFFFFF);

  @override
  Color get branding => Color(0xFF59D9D5);

  @override
  String get pathColorAssert => 'assets/images/card_asset_light.png';
}
