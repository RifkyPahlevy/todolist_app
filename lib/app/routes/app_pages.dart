import 'package:get/get.dart';

import 'package:todo_listapp/app/modules/add_todo/bindings/add_todo_binding.dart';
import 'package:todo_listapp/app/modules/add_todo/views/add_todo_view.dart';
import 'package:todo_listapp/app/modules/edit_page/bindings/edit_page_binding.dart';
import 'package:todo_listapp/app/modules/edit_page/views/edit_page_view.dart';
import 'package:todo_listapp/app/modules/home/bindings/home_binding.dart';
import 'package:todo_listapp/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TODO,
      page: () => AddTodoView(),
      binding: AddTodoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PAGE,
      page: () => EditPageView(),
      binding: EditPageBinding(),
    ),
  ];
}
