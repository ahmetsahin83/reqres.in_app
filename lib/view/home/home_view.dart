import 'package:voco/controller/home_controller.dart';
import 'package:voco/controller/login_controller.dart';
import 'package:voco/export/model_exports.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/view_exports.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: ref.read(loginProvider).logout,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: FutureBuilder<List<UserModel>>(
          future: controller.getUsers(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.black.withOpacity(0.4),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) => Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40.0,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            final List<UserModel> users = snapshot.data!;
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  UserModel user = users[index];
                  return Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundImage:
                                CachedNetworkImageProvider(user.avatar!),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "${user.firstName!} ${user.lastName!.toUpperCase()}",
                          ),
                          Text(user.email!),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
