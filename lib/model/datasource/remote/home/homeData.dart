import 'package:animations/core/class/crud.dart';
import 'package:animations/links.dart';


class HomeData {
  Crud crud;

  HomeData(this.crud);

  homeData() async {
    var response = await crud.getData(AppLinks.serverLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
