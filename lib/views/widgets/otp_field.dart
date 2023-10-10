import 'package:flutter/material.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';

class OtpField extends StatefulWidget {
  const OtpField({Key? key, this.first, this.last, required this.controller})
      : super(key: key);
  final bool? first;
  final dynamic last;
  final TextEditingController controller;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    final bool isFilled = widget.controller.text.isNotEmpty;
    return Stack(
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 8,
          width: SizeConfig.widthMultiplier * 19,
          decoration: BoxDecoration(
              // color: Colors.white,

              border: isFilled
                  ? Border.all(color: const Color(0xFF35C2C1), width: 1.5)
                  : null,
              borderRadius: BorderRadius.circular(6)),
        ),
        SizedBox(
          height: SizeConfig.heightMultiplier * 9,
          width: SizeConfig.widthMultiplier * 19,
          child: AspectRatio(
            aspectRatio: 1.0,
            child: TextField(
              cursorColor: AppColors.primaryClr,
              controller: widget.controller,
              autofocus: true,
              onChanged: (value) {
                if (value.length == 1 && widget.last == false) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.length == 0 && widget.first == false) {
                  FocusScope.of(context).previousFocus();
                }
                setState(() {});
              },
              showCursor: false,
              readOnly: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeConfig.textMultiplier * 3.6,
                  fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier*1.7),
                counter: const Offstage(),
                filled: true,
                fillColor: isFilled ? Colors.white : Colors.grey.shade200,
              
                enabledBorder: widget.controller.text.isEmpty
                    ? OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(6))
                    :  OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1.5, color:  Color(0xFF35C2C1)),
                        borderRadius: BorderRadius.circular(6)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF35C2C1), width: 1.5),
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
