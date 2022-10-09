import 'package:flutter/material.dart';

import '../config/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final int? maxLines;
  const CustomTextField({
    Key? key,
    required this.title,
    this.controller,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppColor.whiteTextStyle.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        TextFormField(
          cursorColor: AppColor.greenColor,
          controller: controller,
          maxLines: maxLines,
          style: AppColor.whiteTextStyle.copyWith(fontSize: 20),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.darkGreyColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.greenColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
