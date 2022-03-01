import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_listapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  HomeController homeC = Get.find();
  DateTime selecDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddTodoView'),
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
                      initialDate: selecDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      if (value != null) {
                        selecDate = value;
                        controller.waktuC.text = selecDate.toString();
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
                  controller.addData();
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
