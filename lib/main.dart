import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mini App with GetX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.put(FavoriteController());

    return Scaffold(
      body: Center(
        child: Obx(
          () => IconButton(
            iconSize: 64,
            icon: Icon(
              controller.isFavourite.value
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: controller.isFavourite.value ? Colors.red : Colors.grey,
            ),
            onPressed: controller.toggleFavorite,
            tooltip: 'Toggle Favorite',
          ),
        ),
      ),
    );
  }
}

class FavoriteController extends GetxController {
  var isFavourite = false.obs;

  void toggleFavorite() {
    isFavourite.value = !isFavourite.value;
  }
}
