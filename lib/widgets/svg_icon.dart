import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconSvg(
        {required String path, double? height, double? width, Color? color}) =>
    path == ''
        ? SizedBox()
        : SvgPicture.asset(
            path,
            height: height,
            width: width,
            color: color,
          );
