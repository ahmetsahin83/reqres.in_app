import 'package:voco/controller/login_controller.dart';
import 'package:voco/export/package_exports.dart';
import 'package:voco/export/view_exports.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: CachedNetworkImage(
                    imageUrl: "https://reqres.in/img/logo.png",
                    color: Colors.white,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                  ),
                ),
                AppTextField(
                  label: 'Email',
                  hint: 'Enter your email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Email is invalid';
                    }
                    return null;
                  },
                  controller: controller.emailController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AppTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    controller: controller.passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
