import 'package:flutter/material.dart';

class AppDecorations {
  static BoxShadow defaultShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.4),
    spreadRadius: 1,
    blurRadius: 2,
    offset: const Offset(0, 3),
  );
  static BoxDecoration whiteBox = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
    ],
    borderRadius: BorderRadius.circular(6),
  );
  static BoxDecoration whitecircle =
      BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade200);
  static BoxDecoration shadowBox = BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(6),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 3),
        ),
      ]);
  // static BoxDecoration borderBox = BoxDecoration(
  //   borderRadius: BorderRadius.circular(12),
  //   border: Border.all(color: AppColors.primaryClr),
  // );
}
