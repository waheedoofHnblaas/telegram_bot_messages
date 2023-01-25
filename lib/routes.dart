import 'package:animations/core/constant/approutes.dart';
import 'package:animations/view/pages/page1.dart';
import 'package:get/get.dart';

import 'view/pages/data_page.dart';
import 'view/pages/user_data_page.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: AppRoute.language,
  //   page: () => const TestView(),
  // ),
  GetPage(
    name: AppRoute.page1,
    page: () =>  Page1(),
  ),
  GetPage(
    name: AppRoute.page_data,
    page: () =>   DataPage(),
  ),
  GetPage(
    name: AppRoute.user_data,
    page: () =>   UserData_Page(),
  ),

];
