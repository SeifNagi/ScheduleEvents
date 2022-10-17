import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/states.dart';
import '../data/network/dio_helper.dart';

class ScheduleCubit extends Cubit<ScheduleStates> {
  ScheduleCubit() : super(ScheduleInitialState());
  static ScheduleCubit get(context) => BlocProvider.of(context);
  List<dynamic> apiData = [];
  int userLength = 0;
  void getScheduleData() {
    emit(ScheduleLoadingState());

    DioHelper.getData(query: {}).then((value) {
      apiData = value.data;
      userLength = value.data[0]['users'].length;
      log('Data:$apiData');
      log('Length ${apiData.length}');
      log('Price: ${apiData[0]['price']}');
      log('placeName: ${apiData[0]['placeName']}');
      //log('date: ');
      final startdate = DateTime.parse(apiData[0]['date']);
      final enddate = DateTime.parse(apiData[0]['finish_date']);

      log('Difference ${enddate.difference(startdate).inDays}');
      log('finish_date: ${apiData[0]['finish_date']}');
      log('users length: $userLength}');
      emit(ScheduleSuccessState());
    }).catchError((error) {
      debugPrint('Error: ${error.toString()}');
      emit(ScheduleErrorState(error.toString()));
    });
  }
}
