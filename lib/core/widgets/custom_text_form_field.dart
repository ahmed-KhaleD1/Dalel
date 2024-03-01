import 'package:flutter/material.dart';

class CustomtextFormField extends StatelessWidget {
  const CustomtextFormField(
      {super.key,
      required this.labelText,
      this.ispassword = false,
      this.onChanged,
      this.onPressedPasswordVisibltyIcon,
      this.obscureText = false});
  final String labelText;
  final bool ispassword;
  final VoidCallback? onPressedPasswordVisibltyIcon;
  final void Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: ispassword
              ? IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF6F6460).withOpacity(0.5),
                  ),
                  onPressed: onPressedPasswordVisibltyIcon,
                )
              : null,
          labelText: labelText,
          labelStyle: TextStyle(
            color: const Color(0xFF6F6460).withOpacity(0.6),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          border: customOutlineBorder(),
          enabledBorder: customOutlineBorder(),
          focusedBorder: customOutlineBorder()),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          width: 1,
          strokeAlign: BorderSide.strokeAlignCenter,
          color: const Color(0xFF0F0D23).withOpacity(0.2),
        ));
  }
}
