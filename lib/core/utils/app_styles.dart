import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle poppinsBlack28(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontWeight: FontWeight.w900,
      color: AppColors.black,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsLight16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w300,
      color: AppColors.black,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w500,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      color: AppColors.deepGrey,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsMedium10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w500,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsRegular12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      color: AppColors.deepGrey,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: AppColors.deepGrey,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w400,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.poppins,
    );
  }

  static TextStyle poppinsSemiBold24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF333333),
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle poppinsSemiBold28(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF333333),
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle heeboRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.heebo,
    );
  }

  static TextStyle heeboBold120(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w700,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.heebo,
    );
  }

  static TextStyle sariaBold32(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontFamily: 'Saira',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle pacificoRegular22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w400,
      color: AppColors.deepBrown,
      fontFamily: AppFonts.pacifico,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double width = MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.sizeOf(context).width
      : MediaQuery.sizeOf(context).height;
  double mobileFontScaleFactor = width / 400;
  double responsiveFontSize = mobileFontScaleFactor * fontSize;
  double upperLimit = fontSize * 1.2;
  double lowerLimit = fontSize * 0.8;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
