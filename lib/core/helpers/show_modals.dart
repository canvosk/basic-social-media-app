import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:basic_social_media_app/features/basic_social_media_bloc/presentation/bloc/profile_page_bloc/profile_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

profilePhotoBottomSheet(BuildContext context) {
  Future.delayed(Duration.zero, () {
    //your code goes here
  });

  return showModalBottomSheet(
    context: context,
    builder: (builder) {
      return BlocListener<ProfilePageBloc, ProfilePageState>(
        listener: (context, state) {
          if (state is ProfilePhotoUpdating) {
            Navigator.pop(context);
          }
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 175.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  var state = context.read<ProfilePageBloc>().state;
                  if (state is ProfilePageDataSuccess) {
                    context.read<ProfilePageBloc>().add(UpdateUserPhoto(
                        source: ImageSource.camera, user: state.user));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      color: golbat140,
                    ),
                    Text(
                      "Kamera ile",
                      style: bodyLargeText(golbat140),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Divider(
                height: 2.h,
                indent: 100,
                endIndent: 100,
              ),
              SizedBox(
                height: 8.h,
              ),
              GestureDetector(
                onTap: () {
                  var state = context.read<ProfilePageBloc>().state;
                  if (state is ProfilePageDataSuccess) {
                    context.read<ProfilePageBloc>().add(UpdateUserPhoto(
                        source: ImageSource.gallery, user: state.user));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.photo,
                      color: golbat140,
                    ),
                    Text(
                      "Galeri ile",
                      style: bodyLargeText(golbat140),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
