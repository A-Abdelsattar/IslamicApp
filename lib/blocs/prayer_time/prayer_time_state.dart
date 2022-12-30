part of 'prayer_time_cubit.dart';

@immutable
abstract class PrayerTimeState {}

class PrayerTimeInitial extends PrayerTimeState {}

class PrayerTimeLoadingState extends PrayerTimeState {}
class PrayerTimeSucssessState extends PrayerTimeState {}
class PrayerTimeErrorState extends PrayerTimeState {}

