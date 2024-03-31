import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/features/advertisement/widgets/InputFormField.dart';
import 'package:rental_rating/features/advertisement/widgets/OptionButton.dart';
import 'package:rental_rating/router/router.dart';

@RoutePage()
class PublishAdvertisementScreen extends StatefulWidget {
  const PublishAdvertisementScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PublishAdvertisementScreen();
}

class _PublishAdvertisementScreen extends State<PublishAdvertisementScreen> {
  final formKey = GlobalKey<FormState>();
  int _selectedButtonIndex = 0;
  int _roomAmmount = 0;
  bool haveFee = true;

  void _handleFee() {
    setState(() {
      haveFee = !haveFee;
    });
  }

  void _handleButtonTap(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  void _handleRoomChoice(int index) {
    setState(() {
      _roomAmmount = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Добавление объявления",
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset("assets/ArrowLeft.png"),
            onPressed: () =>
                AutoRouter.of(context)
                    .pushAndPopUntil(
                    const AccountRoute(), predicate: (_) => false),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: [
              const Column(
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Адрес",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          color: Color.fromARGB(255, 20, 25, 69),
                        ),
                        textAlign: TextAlign.right,
                      )),
                  SizedBox(height: 8),
                  Text(
                    "Укажите адрес как можно подробнее: метро, район, улица, номер дома, ЖК, КП",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Inter',
                        color: Color.fromARGB(143, 20, 25, 69)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const SizedBox(
                    height: 44,
                    width: 300,
                    child: InputFormField(
                      hintText: "Введите адрес",
                    ),
                  ),
                  const SizedBox(width: 0),
                  IconButton(
                      onPressed: () => (),
                      icon: Image.asset("assets/MapNavigate.png",
                          width: 44, height: 44))
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Тип недвижимости",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  OptionButton(
                    text: "Квартира",
                    color: _selectedButtonIndex != 0
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 0
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(0),
                    buttonWidth: 100,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "Комната",
                    color: _selectedButtonIndex != 1
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 1
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(1),
                    buttonWidth: 100,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "Койко-место",
                    color: _selectedButtonIndex != 2
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 2
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(2),
                    buttonWidth: 140,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  OptionButton(
                    text: "Дом, дача",
                    color: _selectedButtonIndex != 3
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 3
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(3),
                    buttonWidth: 113,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "Часть дома",
                    color: _selectedButtonIndex != 4
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 4
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(4),
                    buttonWidth: 113,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "Таунхаус",
                    color: _selectedButtonIndex != 5
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _selectedButtonIndex != 5
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleButtonTap(5),
                    buttonWidth: 113,
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Комнат в квартире",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  OptionButton(
                    text: "Студия",
                    color: _roomAmmount != 0
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 0
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(0),
                    buttonWidth: 100,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "1",
                    color: _roomAmmount != 1
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 1
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(1),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "2",
                    color: _roomAmmount != 2
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 2
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(2),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "3",
                    color: _roomAmmount != 3
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 3
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(3),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "4",
                    color: _roomAmmount != 4
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 4
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(4),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "5",
                    color: _roomAmmount != 5
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 5
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(5),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "6+",
                    color: _roomAmmount != 6
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmmount != 6
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(6),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Цена за месяц",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    width: 295,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую цену",
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "₽/мес.",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Площадь",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    width: 320,
                    height: 44,
                    child: InputFormField(
                      hintText: "Площадь квартиры",
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "м²",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter"
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Этаж",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                      height: 44,
                      width: 160,
                      child: InputFormField(
                        hintText: "Номер этажа",
                      )
                  ),
                  SizedBox(width: 12),
                  Text("из"),
                  SizedBox(width: 12),
                  SizedBox(
                      height: 44,
                      width: 160,
                      child: InputFormField(
                        hintText: "Номер этажа",
                      )
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Год постройки",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    width: 363,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите год постройки",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Размер залога",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    width: 330,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую цену залога",
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "₽",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter"
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Комиссия",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  SizedBox(
                    width: 330,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую комиссию",
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "₽",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter"
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: _handleFee,
                      icon: Image.asset(haveFee
                          ? "assets/CheckboxEmpty.png"
                          : "assets/CheckboxFull.png",
                          height: 20,
                          width: 20,
                      )
                  ),
                  const Text(
                    "Без комиссии",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter"
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Срок аренды",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )
              ),
              const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
