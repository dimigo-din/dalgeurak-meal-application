import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class PageListPage extends StatelessWidget {
  const PageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Route"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.CONVENIENCEFOOD);
            },
            child: const Text("CONVENIENCEFOOD"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.MEALCANCEL);
            },
            child: const Text("MEALCANCEL"),
          ),
        ],
      ),
    );
  }
}
