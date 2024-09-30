import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  List<bool> isReadList = List.generate(10, (_) => false);// Assuming 10 notifications

  // Mark a specific notification as read
  void markAsRead(int index) {
    isReadList[index] = true;
    emit(NotificationUpdated());
  }

  // Mark a specific notification as unread
  void markAsUnread(int index) {
    isReadList[index] = false;
    emit(NotificationUpdated());
  }
}