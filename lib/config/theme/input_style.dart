import 'package:credit_payment/config/theme/app_colors.dart';
import 'package:credit_payment/config/theme/font_size.dart';
import 'package:credit_payment/config/theme/paddings.dart';
import 'package:flutter/material.dart';

class InputsStyles {
  static InputDecoration primaryInputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    double? paddingLeft,
    double? paddingRight,
    double? paddingTop,
    double? paddingBottom,
  }) {
    return InputDecoration(
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryGrey,
      ),
      contentPadding: EdgeInsets.only(
        left: paddingLeft ?? Paddings.paddingX,
        right: paddingRight ?? Paddings.paddingX,
        top: paddingTop ?? Paddings.paddingY,
        bottom: paddingBottom ?? Paddings.paddingY,
      ),
      filled: true,
      fillColor: const Color.fromARGB(207, 236, 230, 230),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryBlack,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static InputDecoration primaryTextAreaDecoration({
    required String hintText,
    double? paddingLeft,
    double? paddingRight,
    double? paddingTop,
    double? paddingBottom,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: FontSize.base,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade900,
      ),
      contentPadding: EdgeInsets.only(
        left: paddingLeft ?? Paddings.paddingX,
        right: paddingRight ?? Paddings.paddingX,
        top: paddingTop ?? Paddings.paddingY,
        bottom: paddingBottom ?? Paddings.paddingY,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      focusColor: AppColors.primaryWhite,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryBlack,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static InputDecoration primaryInputDecorationWithPrefix({
    required String hintText,
    Icon? prefixIcon,
    double? paddingLeft,
    double? paddingRight,
    double? paddingTop,
    double? paddingBottom,
    double? radius,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
        fontSize: FontSize.base,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: EdgeInsets.only(
        left: paddingLeft ?? Paddings.paddingX,
        right: paddingRight ?? Paddings.paddingX,
        top: paddingTop ?? Paddings.paddingY,
        bottom: paddingBottom ?? Paddings.paddingY,
      ),
      filled: true,
      fillColor: Colors.grey.shade100,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
      ),
      prefixIcon: prefixIcon,
    );
  }

  static InputDecoration rideInputDecoration({
    required String hintText,
  }) {
    return InputDecoration(
      isDense: true,
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: FontSize.lg,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 7,
      ),
      filled: true,
      fillColor: AppColors.secondaryGray,
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
    );
  }
}
