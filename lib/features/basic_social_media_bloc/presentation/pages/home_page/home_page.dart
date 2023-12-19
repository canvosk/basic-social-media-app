import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/home_page/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, bottom: 12.h),
              child: Text(
                "Posts",
                style: headingText(golbat140),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 12.h),
                child: IconButton(
                  onPressed: () {
                    debugPrint("Post gönderme ekranı");
                    context.push('/share-post-page');
                  },
                  icon: Icon(
                    Icons.add,
                    size: 28.w,
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 15.h,
              );
            },
            itemBuilder: (context, index) {
              return const PostWidget();
            },
          ),
        ),
      ],
    );
  }
}
