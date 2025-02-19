// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:training_app/constants/text_font_style.dart';

import '../../../../../../gen/colors.gen.dart';

class OtpVerificationWidget extends StatefulWidget {
  final ValueChanged<dynamic>? onChanged;
  final ValueChanged<dynamic>? onCompleted;
  final ValueChanged<dynamic>? onSubmitted;

  final int length;

  const OtpVerificationWidget({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.onSubmitted,
    required this.length,
  });

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.r))),
      child: PinCodeTextField(
        appContext: context,
        length: widget.length,
        obscureText: false,
        animationType: AnimationType.fade,
        cursorColor: Colors.yellow,

        /// problems
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderWidth: 1.5,
          borderRadius: BorderRadius.circular(10.r),
          fieldHeight: 73.h,
          fieldWidth: 79.w,

          /// problesm
          activeFillColor: Colors.grey, //field color after insert value
          inactiveFillColor: Colors.grey, //field color when field is inactive
          selectedFillColor: Colors.grey, //field color when select a field
          /// problems
          activeColor: Colors.grey, //border color after insert value
          inactiveColor:
              Colors.grey.shade300, // border color when unselect a field
          selectedColor: Colors.grey, //  border color when select a field
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        onCompleted: widget.onCompleted ?? (value) {},
        onChanged: widget.onChanged ?? (value) {},
        onSubmitted: widget.onSubmitted ?? (value) {},
        beforeTextPaste: (text) {
          return true; // Allow pasting of text
        },
        textStyle: TextFontStyle.headline16w400cF4F4F4StyleOpenSans
            .copyWith(fontSize: 24.sp),

        /// problems //
      ),
    );
  }
}
