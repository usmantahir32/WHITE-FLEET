import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../Constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../constants/icons.dart';
import '../../../../utils/size_config.dart';

class DetailTile extends StatefulWidget {
  final String image, title;

  const DetailTile({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<DetailTile> createState() => _DetailTileState();
}

class _DetailTileState extends State<DetailTile> {
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 6,
      width: SizeConfig.widthMultiplier * 92,
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 4,
          vertical: SizeConfig.heightMultiplier * 1),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      decoration: AppDecorations.whiteBox,
      child: Row(
        children: [
          Image.asset(
            widget.image,
            height: SizeConfig.imageSizeMultiplier * 7,
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 4),
          Text(
            widget.title,
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          isAdd
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
        ],
      ),
    );
  }
}
