import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  int _roomAmount = 0;
  bool _haveFee = true;
  bool _servicePaymentIncluded = true;

  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController squareController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController maxFloorController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController termController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  void publishAdvertisement() {
    try {
      CollectionReference advertisements =
      FirebaseFirestore.instance.collection('advertisements');

      advertisements.add(
          {
            'adres' : addressController.text.trim(),
            'type' : _selectedButtonIndex,
            'rooms' : _roomAmount,
            'price' : priceController.text.trim(),
            'square' : squareController.text.trim(),
            'floor' : floorController.text.trim(),
            'maxFloor' : maxFloorController.text.trim(),
            'year' : yearController.text.trim(),
            'deposit' : descriptionController.text.trim(),
            'fee' : _haveFee ? feeController.text.trim() : 0,
            'term' : termController.text.trim(),
            'servicePayment' : _servicePaymentIncluded,
            'description' : descriptionController.text.trim()
          }
      );
    } catch (e) {
      print("Unhandled exception while trying to get advertisement collection");
    }

  }

  void _handleServicePayment(bool isInclude) {
    setState(() {
      _servicePaymentIncluded = isInclude;
    });
  }

  void _handleFee() {
    setState(() {
      _haveFee = !_haveFee;
    });
  }

  void _handleButtonTap(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  void _handleRoomChoice(int index) {
    setState(() {
      _roomAmount = index;
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
            onPressed: () => AutoRouter.of(context)
                .pushAndPopUntil(const AccountRoute(), predicate: (_) => false),
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
                  SizedBox(
                    height: 44,
                    width: 300,
                    child: InputFormField(
                      hintText: "Введите адрес",
                      controller: addressController,
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
                  )),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  OptionButton(
                    text: "Студия",
                    color: _roomAmount != 0
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 0
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(0),
                    buttonWidth: 100,
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "1",
                    color: _roomAmount != 1
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 1
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(1),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "2",
                    color: _roomAmount != 2
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 2
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(2),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "3",
                    color: _roomAmount != 3
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 3
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(3),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "4",
                    color: _roomAmount != 4
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 4
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(4),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "5",
                    color: _roomAmount != 5
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 5
                        ? const Color.fromARGB(205, 20, 25, 69)
                        : Colors.white,
                    onPressed: () => _handleRoomChoice(5),
                  ),
                  const SizedBox(width: 8),
                  OptionButton(
                    text: "6+",
                    color: _roomAmount != 6
                        ? Colors.white
                        : const Color.fromARGB(255, 48, 67, 237),
                    textColor: _roomAmount != 6
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 295,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую цену",
                      controller: priceController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "₽/мес.",
                    style: TextStyle(fontFamily: "Inter", fontSize: 14),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 320,
                    height: 44,
                    child: InputFormField(
                      hintText: "Площадь квартиры",
                      controller: squareController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "м²",
                    style: TextStyle(fontSize: 14, fontFamily: "Inter"),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                      height: 44,
                      width: 160,
                      child: InputFormField(
                        hintText: "Номер этажа",
                        controller: floorController,
                      )),
                  const SizedBox(width: 12),
                  const Text("из"),
                  const SizedBox(width: 12),
                  SizedBox(
                      height: 44,
                      width: 160,
                      child: InputFormField(
                        hintText: "Номер этажа",
                        controller: maxFloorController,
                      )),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 363,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите год постройки",
                      controller: yearController,
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 330,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую цену залога",
                      controller: depositController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "₽",
                    style: TextStyle(fontSize: 14, fontFamily: "Inter"),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 330,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите желаемую комиссию",
                      controller: feeController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "₽",
                    style: TextStyle(fontSize: 14, fontFamily: "Inter"),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: _handleFee,
                      icon: Image.asset(
                        _haveFee
                            ? "assets/CheckboxEmpty.png"
                            : "assets/CheckboxFull.png",
                        height: 20,
                        width: 20,
                      )),
                  const Text(
                    "Без комиссии",
                    style: TextStyle(fontSize: 14, fontFamily: "Inter"),
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
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    width: 270,
                    height: 44,
                    child: InputFormField(
                      hintText: "Введите число месяцев",
                      controller: termController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "месяц/-ев",
                    style: TextStyle(fontSize: 14, fontFamily: "Inter"),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Оплата ЖКХ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )),
              const SizedBox(height: 16),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () => _handleServicePayment(true),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            _servicePaymentIncluded
                                ? const Color.fromARGB(255, 48, 67, 237)
                                : const Color.fromARGB(255, 246, 247, 255)),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                        elevation: const MaterialStatePropertyAll<double>(0),
                        shadowColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 48, 67, 237)),
                        side: const MaterialStatePropertyAll<BorderSide>(
                            BorderSide(
                                color: Color.fromARGB(255, 48, 67, 237)))),
                    child: Text(
                      "Включена",
                      style: TextStyle(
                          color: !_servicePaymentIncluded
                              ? const Color.fromARGB(255, 48, 67, 237)
                              : Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () => _handleServicePayment(false),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            !_servicePaymentIncluded
                                ? const Color.fromARGB(255, 48, 67, 237)
                                : const Color.fromARGB(255, 246, 247, 255)),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
                        elevation: const MaterialStatePropertyAll<double>(0),
                        shadowColor: const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 48, 67, 237)),
                        side: const MaterialStatePropertyAll<BorderSide>(
                            BorderSide(
                                color: Color.fromARGB(255, 48, 67, 237)))),
                    child: Text(
                      "Оплачивается отдельно",
                      style: TextStyle(
                          color: _servicePaymentIncluded
                              ? const Color.fromARGB(255, 48, 67, 237)
                              : Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Добавление фотографий",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )),
              const SizedBox(height: 8),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "до 10 фотографий",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      color: Color.fromARGB(143, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )),
              const SizedBox(height: 16),
              Image.asset("assets/ImportPhoto.png"),
              const SizedBox(height: 40),
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Описание",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Inter",
                      color: Color.fromARGB(255, 20, 25, 69),
                    ),
                    textAlign: TextAlign.right,
                  )),
              const SizedBox(height: 16),
              SizedBox(
                height: 88,
                child: InputFormField(
                  hintText: "Расскажите о квартире",
                  controller: descriptionController,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: publishAdvertisement,
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Color.fromARGB(255, 48, 67, 237)),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0)))),
                          child: const Text(
                            "Опубликовать",
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
