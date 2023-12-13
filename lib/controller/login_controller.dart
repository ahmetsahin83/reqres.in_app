import 'package:voco/export/model_exports.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';
import 'package:voco/export/view_exports.dart';
import 'package:voco/router/routes.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginController());

class LoginController extends ChangeNotifier {
  final sharedPrefService = locator<SharedPrefService>();
  final api = locator<Api>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Loading...');
      LoginModel loginInfo = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      final result = await locator<LoginService>().login(loginInfo);
      EasyLoading.dismiss();
      result.fold(
        (fail) {
          debugPrint(fail.failure.toString());
          EasyLoading.showError("Check your email or password",
              duration: const Duration(seconds: 3));
        },
        (token) async {
          await EasyLoading.showSuccess('Login Success',
              duration: const Duration(seconds: 2));
          api.token = token;
          await sharedPrefService.setToken(token);
          navigatorKey.currentContext!.pushReplacementNamed(Routes.home.name);
        },
      );
    }
  }

  logout() {
    sharedPrefService.setToken("");
    api.token = "";
    navigatorKey.currentContext!.pushReplacementNamed(Routes.login.name);
  }
}
