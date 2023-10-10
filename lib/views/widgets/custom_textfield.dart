import 'package:flutter/material.dart';
import '../../constants/decorations.dart';
import '../../utils/size_config.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.suffix,
    this.isSpacing = false,
    this.readOnly = false,
    this.onTap,
  });
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix, suffix;
  final bool isSpacing;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      // height: SizeConfig.heightMultiplier * 4,
      // width: SizeConfig.widthMultiplier * 55,
      margin: EdgeInsets.only(
          bottom: widget.isSpacing ? SizeConfig.heightMultiplier * 1 : 0),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              onTap: widget.onTap,
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: textTheme.bodySmall,
                prefixIcon: widget.prefix == null
                    ? null
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.heightMultiplier * 1),
                        child: widget.prefix,
                      ),
                suffixIcon: widget.suffix == null ? null : widget.suffix,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
