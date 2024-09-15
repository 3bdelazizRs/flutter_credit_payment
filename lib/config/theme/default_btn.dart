import 'package:credit_payment/config/theme/app_colors.dart';
import 'package:credit_payment/config/theme/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
    this.color = AppColors.primaryBlack,
    this.textColor = AppColors.primaryWhite,
    this.valid = true,
    this.width = double.infinity,
    this.isLoading = false,
  });

  final void Function() onPressed;
  final String text;
  final double borderRadius;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;
  final bool valid;
  final double width;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: CupertinoButton(
        onPressed: () => onPressed(),
        color: valid ? color : CupertinoColors.systemGrey,
        borderRadius: BorderRadius.circular(borderRadius),
        pressedOpacity: 0.8,
        padding: padding,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: AppColors.primaryWhite,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: FontSize.base,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
