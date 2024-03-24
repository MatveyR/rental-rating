import 'package:flutter/material.dart';

class LongTextButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;

  const LongTextButton({Key? key, this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 44), // Ширина и высота кнопки
                )),
            child: Text(
              text!,
              style: const TextStyle(color: Color.fromARGB(255, 20, 25, 69)),
            ),
          ))
    ]);
  }
}
