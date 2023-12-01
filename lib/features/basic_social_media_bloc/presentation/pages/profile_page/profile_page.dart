import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/core/helpers/show_modals.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/profile_page_bloc/profile_page_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<ProfilePageBloc, ProfilePageState>(
          builder: (context, state) {
            if (state is ProfilePageGettingData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfilePageDataFailed) {
              return const Center(
                child: Icon(Icons.dangerous),
              );
            } else if (state is ProfilePageDataSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // CircleAvatar(
                      //   radius: 85.w,
                      // ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.user.profileImageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 180.w,
                              height: 180.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          Positioned.fill(
                            bottom: -10.w,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  profilePhotoBottomSheet(context);
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: golbat140,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Icon(
                                      Icons.add,
                                      color: bgColor,
                                      size: 24.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        state.user.name,
                        style: nameText(golbat140),
                      ),
                      Text(
                        state.user.email,
                        style: bodyMediumText(golbat140.withOpacity(0.5)),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.w, vertical: 8.h),
                          child: Text(
                            "Gönderiler",
                            style: bodyXLargeText(golbat140),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // number of items in each row
                                mainAxisSpacing: 1.0, // spacing between rows
                                crossAxisSpacing:
                                    1.0, // spacing between columns
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
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
