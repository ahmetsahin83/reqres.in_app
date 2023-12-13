import '../export/view_exports.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.validator,
      required this.controller,
      this.obscureText = false});
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
