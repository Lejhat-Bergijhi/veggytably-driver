import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggytably_driver/widgets/sliver_search_app_bar.dart';

class HomePageUser extends StatelessWidget {
  const HomePageUser({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    child: Row(children: [
                      Container(),
                      Container(
                        child: Column(children: [
                          Container(),
                          Container(),
                        ]),
                      ),
                    ]),
                  ),
                  Container(),
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}
