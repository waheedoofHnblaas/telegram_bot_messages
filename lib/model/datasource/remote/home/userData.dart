import 'package:animations/core/class/crud.dart';
import 'package:animations/links.dart';

class UserData {
  Crud crud;

  UserData(this.crud);

  userData(userId) async {
    var response = await crud.postData(
      AppLinks.getUserProfilePhotos,
      {'user_id': userId},
    );
    return response.fold((l) => l, (r) => r);
  }
}
