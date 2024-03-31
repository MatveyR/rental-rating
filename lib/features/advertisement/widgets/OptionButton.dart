import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double buttonWidth; // Добавлено свойство для ширины кнопки

  const OptionButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.color,
      this.textColor,
      this.buttonWidth =
          35.0}) // Установите значение по умолчанию или укажите свое значение
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Обернули кнопку в SizedBox для фиксированной ширины
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(
              color ?? const Color.fromARGB(255, 48, 67, 237)),
          shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
          elevation: const MaterialStatePropertyAll<double>(2),
          shadowColor: const MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 48, 67, 237)),
        ),
        child: Text(
          text!,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 14,
              fontFamily: 'Inter'
          ),
        ),
      ),
    );
  }
}
