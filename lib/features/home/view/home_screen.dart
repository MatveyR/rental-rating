import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/features/home/widgets/advertisement_tile.dart';
import 'package:rental_rating/repositories/advertisements/advertisements_repository.dart';
import 'package:rental_rating/repositories/advertisements/models/advertisement.dart';
import 'package:rental_rating/router/router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;

  List<Advertisement>? ads;

  @override
  void initState() {
    setState(() {
      loadAdvertisements();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Объявления'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                if ((user == null)) {
                  AutoRouter.of(context).push(const LoginRoute());
                } else {
                  AutoRouter.of(context).push(const AccountRoute());
                }
              },
              icon: Image.asset(
                "assets/Person.png",
                width: 16,
              ),
              padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(21, 48, 67, 237),
                          spreadRadius: 3,
                          blurRadius: 10,
                          blurStyle: BlurStyle.normal)
                    ]),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: "Адрес, метро, район, шоссе..",
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(82, 20, 25, 69),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          suffixIcon: Image.asset(
                            'assets/Search.png',
                            scale: 3,
                          )),
                    )),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "найдено ${(ads == null) ? 0 : ads!.length} объявлений",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromARGB(82, 20, 25, 69),
                            fontSize: 12
                        ),
                      ),
                    ),
                    TextButton.icon(
                        label: const Text(
                          "Цена",
                          style: TextStyle(
                              color: Color.fromARGB(255, 48, 67, 237),
                              fontSize: 14),
                        ),
                        icon: Image.asset('assets/Sort.png', scale: 3),
                        onPressed: () {}),
                    TextButton.icon(
                        label: const Text(
                          "Рейтинг",
                          style: TextStyle(
                              color: Color.fromARGB(255, 48, 67, 237),
                              fontSize: 14),
                        ),
                        icon: Image.asset('assets/Sort.png', scale: 3),
                        onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 30),
                FutureBuilder<List<Advertisement>>(
                  future: AdvertisementsRepository().getAllAdvertisements(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Ошибка: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("Объявлений нет :("));
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final advertisement = snapshot.data![index];
                            return AdvertisementTile(advertisement: advertisement);
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            )));
  }

  Future<void> loadAdvertisements() async {
    ads = await AdvertisementsRepository().getAllAdvertisements();
  }
}
