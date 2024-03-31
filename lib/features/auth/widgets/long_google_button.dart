import 'package:flutter/material.dart';

class LongGoogleButton extends StatelessWidget {
  final void Function()? onPressed;

  const LongGoogleButton({Key? key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: ElevatedButton.icon(
            icon: Image.asset("assets/GoogleLogo.png"),
            onPressed: onPressed,
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll<Color>(
                    Color.fromARGB(255, 255, 255, 255)),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 44),
                ),
                elevation: const MaterialStatePropertyAll<double>(2),
                shadowColor: const MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 48, 67, 237)
                )
            ),
            label: const Text(
              "Войти с помощью Google",
              style: TextStyle(color: Color.fromARGB(255, 20, 25, 69)),
            ),

          ))
    ]);
  }
}
