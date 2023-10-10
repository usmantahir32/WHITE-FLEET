import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../constants/colors.dart';
import '../../constants/decorations.dart';
import '../../constants/icons.dart';
import '../../utils/size_config.dart';

class IdTile extends StatefulWidget {
  IdTile({
    super.key,
    required this.index,
    required this.image,
    required this.title,
    this.id,
  });
  final String image, title;
  final String? id;
  final int index;

  @override
  State<IdTile> createState() => _IdTileState();
}

class _IdTileState extends State<IdTile> {
  bool isAdd = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
      decoration: AppDecorations.whiteBox,
      child: Center(
        child: Row(
          children: [
            CircleAvatar(
              radius: SizeConfig.imageSizeMultiplier * 4,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage(widget.image),
            ),
            SizedBox(width: SizeConfig.widthMultiplier * 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Visibility(
                  visible: widget.id == null ? false : true,
                  child: Text(
                    widget.id.toString(),
                    style: textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textMediumClr),
                  ),
                ),
              ],
            ),
            const Spacer(),
            widget.index == 0
                ? isAdd
                    ? Icon(
                        FeatherIcons.checkCircle,
                        color: AppColors.greenClr,
                        size: SizeConfig.imageSizeMultiplier * 6,
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isAdd = true;
                          });
                        },
                        icon: Image.asset(
                          AppIcons.plusOutlined,
                          height: SizeConfig.imageSizeMultiplier * 6,
                        ))
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.widthMultiplier * 2,
                      vertical: SizeConfig.heightMultiplier * .5,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.redClr),
                    child: Text(
                      "Release",
                      style: textTheme.bodySmall!
                          .copyWith(color: AppColors.whiteClr),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
