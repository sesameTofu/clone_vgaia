import 'package:flutter_mobile/global/app_path.dart';
import 'package:flutter_mobile/import.dart';
import 'package:lottie/lottie.dart';

Widget get appLoading => SizedBox(
      child: Center(
        child: Lottie.asset(
          AppPath.loading,
          width: 32,
          height: 32,
          fit: BoxFit.fill,
        ),
      ),
    );
