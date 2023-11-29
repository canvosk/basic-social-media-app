import 'package:basic_social_media_app/config/theme/colors.dart';
import 'package:basic_social_media_app/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

profilePhotoBottomSheet(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 175.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
              Row(
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
            ],
          ),
        );
      },
    );
