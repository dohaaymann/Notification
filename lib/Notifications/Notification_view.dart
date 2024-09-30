import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:left_scroll_actions/cupertinoLeftScroll.dart';
import 'package:left_scroll_actions/global/actionListener.dart';
import 'package:left_scroll_actions/leftScroll.dart';
import 'Logic/notification_cubit.dart';
import 'Widgets/NotificationList.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "الاشعارات",
              style:GoogleFonts.tajawal(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                height: 1.5, // Adjusted to a reasonable value
                color: const Color(0xff1E1E1E),
              )
            ),
          ),
          actions: [IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff2468FE),
            ),
          ),],


        ),
        body: Center(
          child: Container(
            width: 381.w,
            child: SingleChildScrollView(
              child: Center(
                child: BlocProvider(
                  create: (context) => NotificationCubit(),
                  child: BlocBuilder<NotificationCubit, NotificationState>(
                    builder: (context, state) {
                      var cubit = context.read<NotificationCubit>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("هذا الأسبوع",style: GoogleFonts.tajawal(
                            fontSize: 16.sp,fontWeight: FontWeight.w500,color: Color(0xff1E1E1E),
                          ),),
                          SizedBox(height:5.h),
                          SizedBox(
                            width: 381.w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10, // Assuming there are 10 notifications
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CupertinoLeftScroll(
                                  buttonWidth: 80.w,
                                  closeTag: LeftScrollCloseTag('tag_$index'),
                                  child: Notificationlist(
                                    isread: cubit.isReadList[index],
                                  ),
                                  buttons: <Widget>[
                                    LeftScrollItem(
                                      text: 'غير مقروء',
                                      widget: Image.asset(
                                        "assets/unreaded.png",
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      color: Color(0xff0E84B6),
                                      // Set button color to green for "read"
                                      onTap: () {
                                        // Action for "unread"
                                        cubit.markAsUnread(index);
                                        print('Marked as unread');
                                      },
                                    ),
                                    LeftScrollItem(
                                      text: 'مقروء',
                                      widget: Image.asset(
                                        "assets/readed.png",
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      color: Color(0xff0EB57A),
                                      // Set button color to green for "read"
                                      onTap: () {
                                        // Action for "read"
                                        cubit.markAsRead(index);
                                        print('Marked as read');
                                      },
                                    ),
                                  ],
                                  onTap: () {
                                    print('Tapped notification item');
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                          // Another notification item
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
