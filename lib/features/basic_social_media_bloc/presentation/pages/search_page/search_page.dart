import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/follow_user_bloc/follow_user_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/search_page_bloc/search_page_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/pages/search_page/widgets/search_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          const SearchTextField(),
          BlocBuilder<SearchPageBloc, SearchPageState>(
            builder: (context, state) {
              debugPrint(state.toString());

              if (state is SearchSuccess) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.searchedUsers.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 15.h,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: state
                                        .searchedUsers[index].profileImageUrl,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.searchedUsers[index].name,
                                        style: nameTextWithSize(golbat140, 16),
                                      ),
                                      Text(
                                        state.searchedUsers[index].email,
                                        style: bodyMediumText(normalTextColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              BlocBuilder<FollowUserBloc, FollowUserState>(
                                builder: (context, followState) {
                                  if (followState is FollowUserInitial) {
                                    return TextButton(
                                      onPressed: () {
                                        debugPrint(
                                            state.searchedUsers[index].userId);
                                        context.read<FollowUserBloc>().add(
                                              FollowUser(
                                                state.searchedUsers[index],
                                              ),
                                            );
                                      },
                                      child: const Text("Follow"),
                                    );
                                  } else if (followState is FollowingUser) {
                                    if (followState.userId !=
                                        state.searchedUsers[index].userId) {
                                      return TextButton(
                                        onPressed: () {
                                          debugPrint(state
                                              .searchedUsers[index].userId);
                                          context.read<FollowUserBloc>().add(
                                                FollowUser(
                                                  state.searchedUsers[index],
                                                ),
                                              );
                                        },
                                        child: const Text("Follow"),
                                      );
                                    }
                                    return const CircularProgressIndicator();
                                  } else if (followState is FollowedUser) {
                                    if (followState.userId !=
                                        state.searchedUsers[index].userId) {
                                      return TextButton(
                                        onPressed: () {
                                          debugPrint(state
                                              .searchedUsers[index].userId);
                                          context.read<FollowUserBloc>().add(
                                                FollowUser(
                                                  state.searchedUsers[index],
                                                ),
                                              );
                                        },
                                        child: const Text("Follow"),
                                      );
                                    }

                                    return const Text("Followed");
                                  } else if (followState is FollowFailed) {
                                    if (followState.userId !=
                                        state.searchedUsers[index].userId) {
                                      return TextButton(
                                        onPressed: () {
                                          debugPrint(state
                                              .searchedUsers[index].userId);
                                          context.read<FollowUserBloc>().add(
                                                FollowUser(
                                                  state.searchedUsers[index],
                                                ),
                                              );
                                        },
                                        child: const Text("Follow"),
                                      );
                                    }

                                    return const Text("Failed");
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              if (state is SearchFailed) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "Hata.",
                      style: headingText(normalTextColor),
                    ),
                  ),
                );
              }
              if (state is SearchEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "Kullanıcı Bulunamadı.",
                      textAlign: TextAlign.center,
                      style: headingText(normalTextColor),
                    ),
                  ),
                );
              }
              if (state is SearchingUser) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Expanded(
                child: Center(
                  child: Text(
                    "Kullanıcı Ara...",
                    textAlign: TextAlign.center,
                    style: headingText(normalTextColor),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
