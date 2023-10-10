import 'package:flutter/material.dart';
import 'package:whitefleet/views/widgets/custom_back_btn.dart';
import '../../utils/size_config.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.leading = const CustomBackBtn(),
    required this.title,
    this.actions,
    this.isleading = false,
  });
  final Widget leading;
  final String title;
  final List<Widget>? actions;
  final bool isleading;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: false,
      title: Text(
        title,
        style: textTheme.headlineLarge,
      ),
      leadingWidth: isleading
          ? SizeConfig.widthMultiplier * 14
          : SizeConfig.widthMultiplier * 3,
      leading: isleading ? leading : const SizedBox(),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.heightMultiplier * 6);
}
