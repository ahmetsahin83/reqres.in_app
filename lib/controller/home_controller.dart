import 'package:voco/export/model_exports.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';
import 'package:voco/export/view_exports.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeController());

class HomeController extends ChangeNotifier {
  List<UserModel> users = [];

  Future<List<UserModel>> getUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    final res = await locator<HomeService>().getUsers();
    res.fold((l) {
      debugPrint(l);
    }, (r) {
      users = r;
    });

    return users;
  }
}
