import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificationlist extends StatelessWidget {
  final bool isread;
  final String? title, subtitle, time;
  const Notificationlist(
      {super.key, required this.isread, this.title, this.subtitle, this.time});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 381.w,
        padding: EdgeInsets.symmetric(vertical: 3.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.5.w, color: Color(0xff6C89A4)),
          color: isread ? Color(0xffFFFFFF) : Color(0xffD9D9D9),
        ),
        child: Row(
          children: [
            Container(
              width: 24.w,
              margin: EdgeInsets.only(bottom: 7.h),
              alignment: Alignment.bottomCenter,
              child: CircleAvatar(
                radius: 4.r,
                backgroundColor:
                isread ? Color(0xffEA0000) : Colors.transparent,
              ),
            ),
            SizedBox(width: 10.w), // Add some space between the avatar and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ??
                        "تم تغيير حالة الطلب #123456",
                    style: GoogleFonts.tajawal(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1E1E1E),
                    ),
                    overflow: TextOverflow.visible, // To avoid overflow
                    maxLines: 4 // Limit the title to 1 line
                  ),
                  Text(
                    subtitle ??
                        "قام ديمو كير بتغيير حالة طلبك الي completed",
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: Color(0xff000000),
                    ),
                      overflow: TextOverflow.visible, // To avoid overflow
                      maxLines: 5
                  ),
                  Text(
                    "منذ ${time ?? " 3 أيام"}",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff1E1E1E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
