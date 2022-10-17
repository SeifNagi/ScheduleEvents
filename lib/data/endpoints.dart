import 'package:intl/intl.dart';

DateTime now = DateTime.now();
String todayDate = DateFormat.yMMMMEEEEd().format(now);
String baseUrl =
    'http://test.meetntrain.com/v1/profile/events/upcoming/8357/?page=1&date_gt=$todayDate';
