import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rental_rating/router/router.dart';

class BottomDialog {
  static void showBottomDialog({String? text,
    required double height,
    required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AutoRouter.of(context).pushAndPopUntil(
                    const HomeRoute(), predicate: (_) => false);
              },
              child: SingleChildScrollView(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16))
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(height: 32),
                            Text(
                              text ??
                                "Произошла какая-то ошибка!\nПопробуйте ещё раз сейчас или позже",
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 50),
                            Image.asset("assets/DialogBackground.png")
                          ],
                      ),
                  )
              )
          );
          }
        );
  }
}
