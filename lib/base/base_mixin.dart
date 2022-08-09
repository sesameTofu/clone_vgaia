import 'package:flutter/material.dart';
import 'package:flutter_mobile/global/app_const.dart';
import 'package:flutter_mobile/global/app_dimension.dart';
import 'package:flutter_mobile/global/app_text_style.dart';
import 'package:flutter_mobile/global/app_theme.dart';
import 'package:flutter_mobile/utils/localization_service.dart';
import 'package:get/get.dart';

export 'package:flutter/material.dart';
export 'package:get/get.dart';

mixin BaseMixin {
  AppTheme get color => Get.find<AppThemeBase>().theme;

  bool get vn => LocalizationService.locale.languageCode == AppConst.langVI;

  AppTextStyle get textStyle => AppTextStyle.share;

  AppSized get sized => AppSized.share;
}

mixin MixinWidget<T extends StatelessWidget> on BaseMixin {}
