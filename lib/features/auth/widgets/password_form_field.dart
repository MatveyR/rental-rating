import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  Function(String)? change;

  PasswordFormField({Key? key, this.hintText, this.controller, this.change})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHiddenPassword = true;

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          autocorrect: false,
          controller: widget.controller,
          obscureText: isHiddenPassword,
          onChanged: widget.change,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(82, 20, 25, 69),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 48, 67, 237)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(82, 20, 25, 69)),
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: togglePasswordView,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Image.asset(
                isHiddenPassword
                    ? 'assets/PasswordHide.png'
                    : 'assets/PasswordNotHide.png',
                scale: 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
