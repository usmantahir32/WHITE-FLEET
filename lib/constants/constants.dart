import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class AppConstants {
  static EdgeInsets defaultHorizPadding =
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4);
  static EdgeInsets mediumHorizPadding =
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6);
  static EdgeInsets largeHorizPadding =
      EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 8);
}
