import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountInitial());
  static CountCubit get(context)=> BlocProvider.of(context);

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

}
