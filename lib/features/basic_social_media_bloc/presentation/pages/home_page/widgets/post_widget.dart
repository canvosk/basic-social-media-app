import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.w, bottom: 12.h),
          child: Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: golbat140,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Can",
                style: nameTextWithSize(golbat140, 16),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300.h,
          color: golbat140,
        ),
      ],
    );
  }
}