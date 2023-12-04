import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/search_page/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              const SearchTextField(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                    TextButton(onPressed: () {}, child: const Text("Follow")),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
