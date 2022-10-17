import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_logiciel/bloc/cubit.dart';
import 'package:task_logiciel/bloc/states.dart';
import 'package:task_logiciel/data/network/dio_helper.dart';
import 'package:task_logiciel/presentation/styles/colors.dart';

import 'presentation/schedule_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => ScheduleCubit()..getScheduleData()),
        )
      ],
      child: BlocConsumer<ScheduleCubit, ScheduleStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Poppins',
              textTheme: TextTheme(
                subtitle1: TextStyle(color: greyColor, fontSize: 12),
                subtitle2: TextStyle(color: orangeColor, fontSize: 12),
                headline1: TextStyle(
                  color: orangeColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                headline2: TextStyle(color: blackColor, fontSize: 16),
                headline3: TextStyle(
                    color: whiteColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                headline4: TextStyle(color: whiteColor, fontSize: 13),
                headline5: TextStyle(color: blackColor, fontSize: 13),
              ),
            ),
            title: 'MeetNTrain',
            debugShowCheckedModeBanner: false,
            home: SchedulePage(),
          );
        },
      ),
    );
  }
}
