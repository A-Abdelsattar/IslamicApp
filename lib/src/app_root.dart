import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/screens/home_screen.dart';

import '../blocs/prayer_time/prayer_time_cubit.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(create: (context)=> PrayerTimeCubit()),
        ],
      child: ScreenUtilInit(
        builder: (BuildContext context, Widget? child) {
          return  MaterialApp(
            home: HomeScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
