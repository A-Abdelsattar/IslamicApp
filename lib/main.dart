import 'package:flutter/material.dart';
import 'package:islamic_app/service/dio_helper/dio_helper.dart';
import 'package:islamic_app/src/app_root.dart';


main(){
  DioHelper.init();
  runApp(AppRoot());
}