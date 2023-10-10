import 'package:flutter/material.dart';
import '../constants/icons.dart';
import '../constants/images.dart';

List onBoardingList = [
  {
    "title": "Faster Scheduling",
    "description":
        "Build the work schedule in minutes. Share and track it instantly.",
    "image": AppImages.welcome,
  },
  {
    "title": "Easier time tracking",
    "description":
        "Integrate Your schedule with the time clock and rduce labor costs",
    "image": AppImages.welcome,
  },
  {
    "title": "Better communicaton",
    "description":
        "Connect with everyone across any shift or department, all in one place.",
    "image": AppImages.welcome,
  },
];

List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

List<String> quickActionTitles = [
  "Task",
  "Enquiry",
  "Chat",
  "Training",
  "Street search"
];
List<String> quickActionimages = [
  AppImages.task,
  AppImages.enquiry,
  AppImages.chat,
  AppImages.training,
  AppImages.streetSearch
];

List<String> assetTitle = [
  "Scan Invoice",
  "Earning",
  "Achievement",
  "My Activity",
  "Employee Documents",
  "Contract Details",
  "Settings",
  "Switch Jobs",
  "Logout",
  "App Permissions"
];

List<String> assetImages = [
  AppImages.scanInvoice,
  AppIcons.money,
  AppImages.medal,
  AppImages.activity,
  AppImages.document,
  AppImages.contract,
  AppImages.setting,
  AppImages.switchJob,
  AppImages.logout,
  AppImages.permissions
];
List<String> optionTitles = [
  "Approvals",
  "Driver Management",
  "Inventory & Task",
  "Enquiry",
  "Task Management",
  "Others"
];
List<String> optionimages = [
  AppImages.approval,
  AppImages.driver,
  AppImages.inventory,
  AppImages.enquiry,
  AppImages.taskManagement,
  AppImages.imac
];
List<String> achievements = [
  AppImages.trophy,
  AppImages.rank,
  AppImages.medal,
  AppImages.prize,
];

List<String> payslipDuration = [
  "1 Month",
  "3 Month",
  "6 Month",
];

List<Color> editDetailColors = [
  const Color(0xffFFE2E0),
  const Color(0xffCFFAC1),
  const Color(0xffFAD8B0)
];
List<String> editDetailsTitle = ["Profile", "Vehicle", "Tax"];

List<String> editDetailIcons = [AppIcons.user, AppIcons.vehicle, AppIcons.tax];

List<String> moreTitle = [
  "My Activity",
  "Employee Documents",
  "Contract Details",
  "Settings",
  "Switch Jobs",
  "Logout",
  "App Permissions"
];

List<String> moreImages = [
  AppImages.activity,
  AppImages.document,
  AppImages.contract,
  AppImages.setting,
  AppImages.switchJob,
  AppImages.logout,
  AppImages.permissions
];

List<String> jobsTitle = ["Routes", "Deppo", "Schools", "Pickup's"];
List<String> jobImages = [
  AppImages.route,
  AppImages.deppo,
  AppImages.school,
  AppImages.deppo
];
List<String> inventorysTitle = ["Bay", "Wave", "Id", "Scanner Id", "Van Rego"];

List<String> inventoryImages = [
  AppImages.bay,
  AppImages.wave,
  AppImages.id,
  AppImages.scanner,
  AppImages.vanRego
];

List<String> mapTypes = ["Driver View", "Task View"];
List<String> mapFilters = ["Task and enquiries", "Warnings"];
