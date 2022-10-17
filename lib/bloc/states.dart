abstract class ScheduleStates {}

class ScheduleInitialState extends ScheduleStates {}

class ScheduleLoadingState extends ScheduleStates {}

class ScheduleSuccessState extends ScheduleStates {}

class ScheduleErrorState extends ScheduleStates {
  final String error;
  ScheduleErrorState(this.error);
}
