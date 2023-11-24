import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 85.w,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Can",
                  style: nameText(golbat140),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    child: Text(
                      "Gönderiler",
                      style: bodyXLargeText(golbat140),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // number of items in each row
                          mainAxisSpacing: 1.0, // spacing between rows
                          crossAxisSpacing: 1.0, // spacing between columns
                        ),
                        itemCount: 15,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.red,
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
