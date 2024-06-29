import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.textColor,
      this.borderRadius,
      this.fontSize = 18, this.onPressed});
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 48,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(16)),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: Styles.testStyle18.copyWith(
                color: textColor ?? Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: fontSize,
              ),
            )),
      ),
    );
  }
}
