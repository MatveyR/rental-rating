import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../repositories/advertisements/models/advertisement.dart';
import '../../../router/router.dart';

@RoutePage()
class AdvertisementScreen extends StatefulWidget {
  const AdvertisementScreen({super.key, required this.advertisement});

  final Advertisement advertisement;

  @override
  State<AdvertisementScreen> createState() => _AdvertisementScreenState();
}

class _AdvertisementScreenState extends State<AdvertisementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context)
                .pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
          },
          icon: Image.asset("assets/ArrowLeft.png", scale: 3),
        ),
        title: const Text("Объявление"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/Edit.png', scale: 3))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: widget.advertisement.imageUrl == ""
                        ? Image.asset('assets/RoomExample.png')
                        : CachedNetworkImage(
                        imageUrl: widget.advertisement.imageUrl!),
                  ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.advertisement.price} ₽/мес.",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Image.asset("assets/Like.png", scale: 3),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 52,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [ BoxShadow(
                      color: Color.fromARGB(21, 48, 67, 237),
                      spreadRadius: 3,
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal)
                  ]
                ),
                child: Column(children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                          Text(
                            "${widget.advertisement.rooms} комн.",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text(
                            "квартира",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(143, 20, 25, 69)
                            ),
                          ),
                        ],
                      )),
                      Expanded(child: Column(
                        children: [
                          Text(
                            "${widget.advertisement.square} м²",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text(
                            "общая пл.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(143, 20, 25, 69)
                            ),
                          ),
                        ],
                      )),
                      Expanded(child: Column(
                        children: [
                          Text(
                            "${widget.advertisement.floor} из ${widget.advertisement.maxFloor}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const Text(
                            "этаж",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(143, 20, 25, 69)
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ])
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    widget.advertisement.address ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(143, 20, 25, 69)
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/Map.png')
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/Avatar.png', scale: 3)
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Александр М"),
                        Image.asset('assets/Raiting.png', scale: 3),
                      ],
                    ),
                  ),
                  Image.asset('assets/Call.png', scale: 3),
                ],
              ),
              const SizedBox(height: 32),
              const Row(children: [Text("Или напишите пока в сети")]),
              const SizedBox(height: 24),
              Row(children: [Image.asset('assets/Messages.png', scale: 3)]),
              const SizedBox(height: 32),
              const Row(children: [Text("Условия сделки", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)],),
              const SizedBox(height: 16),
              Row(children: [Image.asset('assets/11.png', scale: 3)]),
              const SizedBox(height: 32),
              Row(children: [Image.asset('assets/2.png', scale: 3)]),
              const SizedBox(height: 32),
              Row(children: [Image.asset('assets/3.png', scale: 3)]),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
