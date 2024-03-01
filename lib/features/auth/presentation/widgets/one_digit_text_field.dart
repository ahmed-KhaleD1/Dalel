import 'package:flutter/material.dart';

class OneDigitTextField extends StatelessWidget {
  const OneDigitTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field can't be empty";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF0F0D23),
          fontSize: 28,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w900,
        ),
        decoration: const InputDecoration(
            counterText: '',
            contentPadding: EdgeInsets.all(4),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Color(0xFF0F0D23)),
            )),
      ),
    );
  }
}
