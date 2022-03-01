import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_listapp/app/data/models/todo_model.dart';
import 'package:todo_listapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_page_controller.dart';

class EditPageView extends GetView<EditPageController> {
  Todo todo = Get.arguments;
  HomeController homeC = Get.find();
  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    controller.kegiatanC.text = todo.kegiatan!;
    controller.waktuC.text = todo.waktu!;

    return Scaffold(
      appBar: AppBar(
        title: Text('EditPageView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.kegiatanC,
            decoration: InputDecoration(
              labelText: 'kegiatan',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.waktuC,
            decoration: InputDecoration(
              labelText: 'waktu',
              border: OutlineInputBorder(),
              suffix: IconButton(
                  onPressed: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      if (value != null) {
                        selectDate = value;
                        controller.waktuC.text = selectDate.toString();
                      }
                    });
                  },
                  icon: Icon(Icons.date_range_outlined)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (controller.isLoading.isFalse) {
                  controller.editTodo(todo.id!);
                  homeC.getAllTodo();
                  Get.back();
                }
              },
              child: Obx(() =>
                  Text(controller.isLoading.isFalse ? "Add Todo" : "Loading"))),
        ],
      ),
    );
  }
}
