import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/core/helpers/profile_page_funcs.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/domain/entities/user_management_entity.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/following_bloc/following_bloc.dart';
import 'package:basic_social_media_app/injection_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FollowingDetailWidget extends StatelessWidget {
  final UserManagementEntity user;
  const FollowingDetailWidget({super.key, required this.user});

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
                "Following",
                style: nameText(golbat140),
              ),
            ],
          ),
          BlocProvider(
            create: (context) => FollowingBloc(sl()),
            child: BlocBuilder<FollowingBloc, FollowingState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: user.following.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemBuilder: (context, index) {
                        bool isUnfollowed = false;

                        if (state is FollowingBlocSuccess) {
                          isUnfollowed = ProfilePageFuncs.chekUnfollowed(
                              unFollowedUsers: state.unFollowedUsers,
                              userId: user.following[index].userId);
                        } else if (state is FollowingBlocLoading) {
                          isUnfollowed = ProfilePageFuncs.chekUnfollowed(
                              unFollowedUsers: state.unFollowedUsers,
                              userId: user.following[index].userId);
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      user.following[index].profileImageUrl,
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
                                      user.following[index].name,
                                      style: nameTextWithSize(golbat140, 16),
                                    ),
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        user.following[index].email,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyMediumText(normalTextColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            state is FollowingBlocSuccess
                                ? TextButton(
                                    onPressed: () {
                                      List<String> newList =
                                          state.unFollowedUsers;

                                      if (!isUnfollowed) {
                                        newList = List.from(newList)
                                          ..add(user.following[index].userId);

                                        context.read<FollowingBloc>().add(
                                              UnfollowFollowerEvent(
                                                currentUser:
                                                    user.following[index],
                                                unFollowedUsers: newList,
                                              ),
                                            );
                                        return;
                                      }

                                      newList = List.from(newList)
                                        ..remove(user.following[index].userId);

                                      context.read<FollowingBloc>().add(
                                            FollowFollowerEvent(
                                              currentUser:
                                                  user.following[index],
                                              unFollowedUsers: newList,
                                            ),
                                          );
                                      return;
                                    },
                                    child: Text(
                                        isUnfollowed ? "Follow" : "Unfollow"),
                                  )
                                : state is FollowingBlocLoading
                                    ? state.currentUser.userId ==
                                            user.following[index].userId
                                        ? const CircularProgressIndicator()
                                        : TextButton(
                                            onPressed: () {},
                                            child: Text(isUnfollowed
                                                ? "Follow"
                                                : "Unfollow"),
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
