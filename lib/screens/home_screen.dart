import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:islamic_app/blocs/prayer_time/prayer_time_cubit.dart';
import 'package:islamic_app/components/container_card.dart';
import 'package:intl/intl.dart';


import '../src/app_colors.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountdownTimerController? controller;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 4500;

  @override
  void initState() {
    super.initState();
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);


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
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/WhatsApp Image 2022-12-30 at 10.14.15 AM (1).jpeg')
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(cubit.prayerTime!.data!.date!.hijri!.weekday!.ar!,style: TextStyle(color: Colors.white),),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 105,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white,width: 1),
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.0,left: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(cubit.prayerTime!.data!.date!.hijri!.month!.ar!,style: TextStyle(color: Colors.white),),
                                  VerticalDivider(
                                    color: Colors.white,
                                    width: 10,
                                    thickness: 3,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Text(cubit.prayerTime!.data!.date!.hijri!.day!,style: TextStyle(color: Colors.white),),
                                ],
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
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.KmainColor
                ),
                child: Center(
                    child:
                      CountdownTimer(
                      controller: controller,
                      onEnd: onEnd,
                      endTime: endTime,
                    )
                ),
              ),
              SizedBox(
                height: 20,
              ),


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
        ),
      );
    });
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
