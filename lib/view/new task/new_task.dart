import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/app_color.dart';
import 'package:task_manager/view/new%20task/components/addtask_body.dart';

class NewTask {
  NewTask(Size size) {
    Get.bottomSheet(
        backgroundColor: black,
        isScrollControlled: true,
          TaskBody());

  }
}
