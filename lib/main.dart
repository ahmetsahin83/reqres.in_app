import 'package:voco/theme/app_theme.dart';
import 'export/view_exports.dart';
import 'export/package_exports.dart';
import "export/service_exports.dart";

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        builder: EasyLoading.init(),
        title: 'DEMO',
        theme: theme,
      ),
    );
  }
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  serviceLocatorInit();
  locator<Api>().token = SharedPrefService().getToken();
}
