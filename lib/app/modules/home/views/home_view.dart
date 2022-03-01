import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_listapp/app/data/models/todo_model.dart';
import 'package:todo_listapp/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getAllTodo(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return Obx(
              () => (controller.allTodo.length == 0)
                  ? Center(child: Text("Tidak Ada Data"))
                  : ListView.builder(
                      itemCount: controller.allTodo.length,
                      itemBuilder: (context, index) {
                        Todo todo = controller.allTodo[index];
                        return ListTile(
                          onTap: () =>
                              Get.toNamed(Routes.EDIT_PAGE, arguments: todo),
                          trailing: IconButton(
                            onPressed: () => controller.deleteData(todo.id!),
                            icon: Icon(Icons.delete),
                          ),
                          title: Text('${todo.kegiatan}'),
                          leading: CircleAvatar(
                            child: Text("$index"),
                          ),
                          subtitle: Text("${todo.waktu}"),
                        );
                      },
                    ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_TODO);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
