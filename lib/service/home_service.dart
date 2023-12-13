import 'package:voco/export/model_exports.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/service_exports.dart';

class HomeService {
  Dio get dio => Api.dio;
  Future<Either<String, List<UserModel>>> getUsers() async {
    try {
      final res = await dio.get(Api.users);
      if (res.statusCode == 200) {
        final data = ResponseModel.fromJson(res.data);
        final users = data.data!;
        return Right(users);
      }
      return const Left("Status code is not 200");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
