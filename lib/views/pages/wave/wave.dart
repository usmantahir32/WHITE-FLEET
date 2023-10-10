import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/wave.dart';
import 'package:whitefleet/models/wave.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/icons.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../bottom sheets/add_wave.dart';

class WaveScreen extends StatelessWidget {
  WaveScreen({super.key});
  final cont = Get.put(WaveCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isleading: true,
        title: "Wave",
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddWaveBS(), isScrollControlled: true),
              icon: Icon(
                FeatherIcons.plus,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                AppIcons.notification,
                color: Colors.black,
                size: SizeConfig.imageSizeMultiplier * 8,
              ))
        ],
      ),
      body: Obx(
        () => cont.getWave == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getWave!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Waves not found!',
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getWave!.data!.length,
                            (index) =>
                                WaveTile(model: cont.getWave!.data![index]),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class WaveTile extends StatelessWidget {
  WaveTile({
    super.key,
    required this.model,
  });
  final WaveData model;
  final cont = Get.find<WaveCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      // height: SizeConfig.heightMultiplier * 10,
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.heightMultiplier * 2,
          horizontal: SizeConfig.widthMultiplier * 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.greyClr),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                "${_formattedTime(model.startTime!).format(context)} ~ ${_formattedTime(model.endTime!).format(context)}",
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMediumClr),
              )
            ],
          ),
          const Spacer(),

          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddWaveBS(data: model),
                isScrollControlled: true),
            child: CircleAvatar(
              radius: SizeConfig.widthMultiplier * 3.5,
              backgroundColor: Colors.blue,
              child: Icon(FeatherIcons.edit, size: 16, color: Colors.white),
            ),
          ),
          SizedBox(width: SizeConfig.widthMultiplier * 2),
          //DELETE
          InkWell(
            onTap: () => Get.dialog(ConfirmationDialog(
                title: 'Delete ${model.name}?',
                subtitle: 'Are you sure you want to delete this wave?',
                onContinue: () => cont.deleteWave(model.id!))),
            child: CircleAvatar(
              radius: SizeConfig.widthMultiplier * 3.5,
              backgroundColor: Colors.red,
              child: Icon(FeatherIcons.trash2, size: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  TimeOfDay _formattedTime(String value) {
    // Parse the input string and extract hours and minutes
    List<String> parts = value.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    TimeOfDay time = TimeOfDay(hour: hours, minute: minutes);
    return time;
  }
}
