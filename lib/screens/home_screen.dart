import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_app/blocs/prayer_time/prayer_time_cubit.dart';
import 'package:islamic_app/components/container_card.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/components/counter_timer.dart';
import 'package:islamic_app/models/prayer_time.dart';


import '../models/counter_models.dart';
import '../src/app_colors.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.timeplayNow = false});
  bool timeplayNow;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    PrayerTimeCubit.get(context)..getPrayer();
    if (widget.timeplayNow == true) {
      AudioCache player = AudioCache(prefix: 'assets/sound/');
      player.play('PraySound.mpeg.mp3');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PrayerTimeCubit,PrayerTimeState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = PrayerTimeCubit.get(context);
      return Scaffold(
        body: cubit.prayerTime == null ?
        Center(
          child: CircularProgressIndicator(),
        ):
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/WhatsApp Image 2022-12-30 at 10.14.15 AM (1).jpeg')
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(cubit.prayerTime!.data!.date!.hijri!.weekday!.ar!,style: TextStyle(color: Colors.white),),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 105.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white,width: 1.w),
                                borderRadius: BorderRadius.circular(4.r)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 2,left: 4),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(cubit.prayerTime!.data!.date!.hijri!.month!.ar!,style: TextStyle(color: Colors.white),),
                                      VerticalDivider(
                                        color: Colors.white,
                                        width: 10.w,
                                        thickness: 1.w,

                                      ),
                                      Text(cubit.prayerTime!.data!.date!.hijri!.day!,style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(cubit.prayerTime!.data!.date!.hijri!.year!,style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.KmainColor
                  ),
                  child: Center(
                      child: CounterTime(
                        prayTime: [
                      counterModels(
                      time: cubit.prayerTime!.data!.timings!.fajr,
                          title: 'الفجر'),
                    counterModels(
                        time: cubit.prayerTime!.data!.timings!.dhuhr,
                        title: 'الظهر'),
                    counterModels(
                        time: cubit.prayerTime!.data!.timings!.asr,
                        title: 'العصر'),
                    counterModels(
                        time: cubit.prayerTime!.data!.timings!.maghrib,
                        title: 'المغرب'),
                    counterModels(
                        time: cubit.prayerTime!.data!.timings!.isha,
                        title: 'العشاء')
                    ],

                  )
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Column(
                    children: [
                      ContainerCard(
                        text: cubit.prayerTime!.data!.timings!.fajr!,
                        text2:'الفجر' ,
                      ),
                      ContainerCard(
                        text: cubit.prayerTime!.data!.timings!.dhuhr!,
                        text2: 'الظهر',
                      ),
                      ContainerCard(
                        text:cubit.prayerTime!.data!.timings!.asr! ,
                        text2: 'العصر',
                      ),
                      ContainerCard(
                        text: cubit.prayerTime!.data!.timings!.maghrib!,
                        text2: 'المغرب',
                      ),
                      ContainerCard(
                        text: cubit.prayerTime!.data!.timings!.isha!,
                        text2: 'العشاء',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
