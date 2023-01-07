import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/service/dio_helper/dio_helper.dart';
import 'package:islamic_app/src/app_root.dart';


main() async {
  await ScreenUtil.ensureScreenSize();

  DioHelper.init();
  runApp(AppRoot());
}