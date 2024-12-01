import 'package:blog_app/core/theme/color_constants.dart';
import 'package:flutter/material.dart';

Widget customCircularProgressIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      strokeWidth: 3,
      color: ColorConstants.primaryColor,
    ),
  );
}
