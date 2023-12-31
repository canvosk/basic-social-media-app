import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/core/helpers/profile_page_funcs.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/followers_bloc/followers_bloc.dart';
import 'package:basic_social_media_app/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FollowersDetailWidget extends StatelessWidget {
  final UserManagementEntity user;
  const FollowersDetailWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 24.w,
                  color: golbat140,
                ),
              ),
              Text(
                "Followers",
                style: nameText(golbat140),
              ),
            ],
          ),
          BlocProvider(
            create: (context) => FollowersBloc(sl()),
            child: BlocBuilder<FollowersBloc, FollowersState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: user.followers.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        bool isRemoved = false;

                        if (state is FollowersBlocSuccess) {
                          if (state.removedUsers
                              .contains(user.followers[index].userId)) {
                            isRemoved = true;
                          }
                        }

                        if (state is FollowersBlocLoading) {
                          if (state.removedUsers
                              .contains(user.followers[index].userId)) {
                            isRemoved = true;
                          }
                        }

                        bool isIFollow = false;

                        isRemoved
                            ? isIFollow = false
                            : isIFollow = ProfilePageFuncs.checkFollowers(
                                userManagementEntity: user,
                                followerId: user.followers[index].userId);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      user.followers[index].profileImageUrl,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.followers[index].name,
                                      style: nameTextWithSize(golbat140, 16),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        user.followers[index].email,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyMediumText(normalTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            state is FollowersBlocSuccess
                                ? TextButton(
                                    onPressed: () {
                                      if (isRemoved) {
                                        return;
                                      }

                                      List<String> newList = state.removedUsers;

                                      newList = List.from(newList)
                                        ..add(user.followers[index].userId);

                                      context.read<FollowersBloc>().add(
                                            RemoveFollowerEvent(
                                              currentUser:
                                                  user.followers[index],
                                              removedUsers: newList,
                                            ),
                                          );
                                    },
                                    child: Text(isRemoved
                                        ? "Removed"
                                        : isIFollow
                                            ? "Remove"
                                            : "Removed"),
                                  )
                                : state is FollowersBlocLoading
                                    ? TextButton(
                                        onPressed: () {},
                                        child: state.currentUser.userId ==
                                                user.followers[index].userId
                                            ? const CircularProgressIndicator()
                                            : Text(isRemoved
                                                ? "Removed"
                                                : isIFollow
                                                    ? "Remove"
                                                    : "Removed"),
                                      )
                                    : Container(),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
