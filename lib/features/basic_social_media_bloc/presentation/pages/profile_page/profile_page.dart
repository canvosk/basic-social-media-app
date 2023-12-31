import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/core/helpers/show_modals.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/profile_page_bloc/profile_page_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            } else if (state is ProfilePageDataSuccess ||
                state is ProfilePhotoUpdating) {
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
                          state is ProfilePageDataSuccess
                              ? CachedNetworkImage(
                                  imageUrl: state.user.myUser.profileImageUrl,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 180.w,
                                    height: 180.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Container(
                                      width: 180.w,
                                      height: 180.w,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                          child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : Container(
                                  width: 180.w,
                                  height: 180.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                          Positioned.fill(
                            bottom: -10.w,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  profilePhotoBottomSheet(context:context,isProfile: true);
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
                        state is ProfilePageDataSuccess
                            ? state.user.myUser.name
                            : state is ProfilePhotoUpdating
                                ? state.user.myUser.name
                                : "",
                        style: nameText(golbat140),
                      ),
                      Text(
                        state is ProfilePageDataSuccess
                            ? state.user.myUser.email
                            : state is ProfilePhotoUpdating
                                ? state.user.myUser.email
                                : "",
                        style: bodyMediumText(golbat140.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          state is ProfilePageDataSuccess
                              ? context.push('/followers-detail-page',
                                  extra: state.user)
                              : null;
                        },
                        child: Column(
                          children: [
                            Text(
                              "Followers",
                              style: bodyXLargeText(golbat140),
                            ),
                            Text(
                              state is ProfilePageDataSuccess
                                  ? state.user.followers.length.toString()
                                  : state is ProfilePhotoUpdating
                                      ? state.user.followers.length.toString()
                                      : "0",
                              style:
                                  bodyLargeText(golbat140.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          state is ProfilePageDataSuccess
                              ? context.push('/following-detail-page',
                                  extra: state.user)
                              : null;
                        },
                        child: Column(
                          children: [
                            Text(
                              "Following",
                              style: bodyXLargeText(golbat140),
                            ),
                            Text(
                              state is ProfilePageDataSuccess
                                  ? state.user.following.length.toString()
                                  : state is ProfilePhotoUpdating
                                      ? state.user.following.length.toString()
                                      : "0",
                              style:
                                  bodyLargeText(golbat140.withOpacity(0.5)),
                            ),
                          ],
                        ),
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
