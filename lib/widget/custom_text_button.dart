// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../config/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CustomTextButton({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.greenColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppColor.whiteTextStyle.copyWith(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
