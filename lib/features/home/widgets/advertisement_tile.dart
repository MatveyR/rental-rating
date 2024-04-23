import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:rental_rating/repositories/advertisements/models/advertisement.dart';
import 'package:rental_rating/router/router.dart';

class AdvertisementTile extends StatelessWidget {
  const AdvertisementTile({Key? key, required this.advertisement})
      : super(key: key);

  final Advertisement advertisement;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => AutoRouter.of(context).pushAndPopUntil(
            AdvertisementRoute(advertisement: advertisement),
            predicate: (_) => false),
        child: Container(
            height: 165,
            width: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: advertisement.imageUrl == ""
                          ? Image.asset('assets/RoomExample.png')
                          : CachedNetworkImage(
                              imageUrl: advertisement.imageUrl!),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    Text(
                      '${advertisement.price} ₽/мес.',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '${advertisement.rooms}-комнатная кв.',
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(160, 20, 25, 69)),
                      ),
                      const SizedBox(width: 5),
                      Image.asset('assets/Separator.png', scale: 3),
                      const SizedBox(width: 5),
                      Text(
                        '${advertisement.square} м²',
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(160, 20, 25, 69)),
                      ),
                      const SizedBox(width: 5),
                      Image.asset('assets/Separator.png', scale: 3),
                      const SizedBox(width: 4),
                      Text(
                        '${advertisement.floor}/${advertisement.maxFloor}',
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(160, 20, 25, 69)),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    Flexible(
                      child: Text(
                        advertisement.address ?? "",
                        style: const TextStyle(
                            fontSize: 8,
                            color: Color.fromARGB(160, 20, 25, 69)),
                        softWrap: true,
                      ),
                    )
                  ])
                ],
              ),
            )));
  }
}
