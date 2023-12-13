import 'package:voco/export/model_exports.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';

class LoginService {
  Dio get dio => Api.dio;
  Future<Either<Fail, String>> login(LoginModel loginInfo) async {
    try {
      final res = await dio.post(Api.login, data: loginInfo.toJson());
      if (res.statusCode == 200) {
        return Right(res.data['token']);
      }

      return Left(Fail("error"));
    } catch (e) {
      return Left(Fail(e));
    }
  }
}
