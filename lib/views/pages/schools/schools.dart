import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:whitefleet/controllers/schools.dart';
import 'package:whitefleet/models/schools.dart';
import 'package:whitefleet/views/widgets/confirmation_dialog.dart';
import 'package:whitefleet/views/widgets/custom_appbar.dart';
import 'package:whitefleet/constants/colors.dart';
import 'package:whitefleet/utils/size_config.dart';
import 'package:whitefleet/views/widgets/loading.dart';
import 'package:whitefleet/views/widgets/no_data.dart';
import 'package:whitefleet/views/widgets/readmore.dart';
import '../../../constants/icons.dart';
import '../../bottom sheets/add_school.dart';

class SchoolsScreen extends StatelessWidget {
  SchoolsScreen({super.key});
  final cont = Get.put(SchoolsCont());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "School",
        isleading: true,
        actions: [
          IconButton(
              onPressed: () =>
                  Get.bottomSheet(AddSchoolBS(), isScrollControlled: true),
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
        () => cont.getSchool == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 80)
            : cont.getSchool!.data!.isEmpty
                ? NoDataWidget(
                    text: 'Schools not found!',
                  )
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: SizeConfig.heightMultiplier * 2),
                          ...List.generate(
                            cont.getSchool!.data!.length,
                            (index) =>
                                SchoolTile(data: cont.getSchool!.data![index]),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class SchoolTile extends StatelessWidget {
  SchoolTile({
    super.key,
    required this.data,
  });
  final SchoolsData data;
  final cont = Get.find<SchoolsCont>();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name!,
                style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.55)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 60,
                child: CustomReadMore(text: data.address!),
              ),
            ],
          ),
          const Spacer(),
          //EDIT
          InkWell(
            onTap: () => Get.bottomSheet(AddSchoolBS(schoolsData: data),
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
                title: 'Delete ${data.name}?',
                subtitle: 'Are you sure you want to delete this school?',
                onContinue: () => cont.deleteSchool(data.id!))),
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
}
