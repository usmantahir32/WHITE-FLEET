import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../Constants/colors.dart';
import '../../utils/size_config.dart';

class CustomAuthTextField extends StatefulWidget {
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isLargeTextfield = false,
    this.isPassword = false,
    this.keyboardType,
    this.isSpacing = true,
    this.error = '',
    this.onTap,
  });
  final String hintText;
  final bool isLargeTextfield;
  final TextEditingController controller;
  final bool isPassword;
  final String error;
  final bool isSpacing;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  @override
  State<CustomAuthTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomAuthTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: SizeConfig.widthMultiplier * 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.only(
                bottom:
                    !widget.isSpacing ? 0 : SizeConfig.heightMultiplier * 2.2),
            child: TextField(
              enabled: widget.onTap != null ? false : true,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? isObscure : false,
              maxLines: widget.isLargeTextfield ? 5 : 1,
              decoration: InputDecoration(
                  isCollapsed: true,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () => setState(() {
                                isObscure = !isObscure;
                              }),
                          icon: Icon(
                            isObscure ? FeatherIcons.eye : FeatherIcons.eyeOff,
                            size: 20,
                          ))
                      : null,
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 5,
                      vertical: SizeConfig.heightMultiplier * 1.5),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: widget.error == ''
                              ? Colors.white
                              : AppColors.redClr)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: widget.error == ''
                              ? AppColors.primaryClr
                              : AppColors.redClr))),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: widget.error == ''
              ? const SizedBox()
              : Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.widthMultiplier * 1),
                  child: Text(widget.error,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 1.3,
                          color: AppColors.redClr,
                          fontWeight: FontWeight.w500)),
                ),
        )
      ],
    );
  }
}
