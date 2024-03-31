import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;

  const InputFormField({Key? key, this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(82, 20, 25, 69),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 48, 67, 237)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(82, 20, 25, 69)),
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
