import 'package:flutter/material.dart';

class LongElevatedButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;

  const LongElevatedButton({Key? key, this.text, this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
                color ?? const Color.fromARGB(255, 48, 67, 237)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 44), // Ширина и высота кнопки
            )),
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white),
        ),
      ))
    ]);
  }
}
