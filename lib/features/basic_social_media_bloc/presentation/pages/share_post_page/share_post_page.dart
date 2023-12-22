import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/core/helpers/show_modals.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/share_post_bloc/share_post_bloc.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/widgets/my_post_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SharePostPage extends StatelessWidget {
  const SharePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController postController = TextEditingController();
    return BlocBuilder<SharePostBloc, SharePostState>(
      builder: (context, state) {
        return state is PostEditing
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                              "Share Post",
                              style: nameText(golbat140),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            profilePhotoBottomSheet(
                                context: context, isProfile: false);
                          },
                          icon: Icon(
                            Icons.photo,
                            size: 24.w,
                            color: golbat140,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: MyPostTextField(
                        controller: postController,
                        hintText: "What's happening?",
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    state.image != null
                        ? Image.file(state.image!)
                        : Container(),
                    ElevatedButton(
                      onPressed: () {
                        context.read<SharePostBloc>().add(SharePost(
                            content: postController.text, image: state.image));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: golbat140,
                        padding: EdgeInsets.symmetric(
                            horizontal: 48.w, vertical: 12.h),
                      ),
                      child: Text(
                        "Share",
                        style: bodyLargeText(bgColor),
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
