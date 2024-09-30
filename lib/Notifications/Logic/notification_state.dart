part of 'notification_cubit.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationUpdated extends NotificationState {} // State to indicate an update in notification list
