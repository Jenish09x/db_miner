import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/screen/like/controller/like_controller.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  LikeController controller = Get.put(LikeController());
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Image.asset(
                homeController.isLight.value
                    ? "assets/image/bg3.jpg"
                    : "assets/image/bg2.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              ListView.builder(
                itemCount: controller.likeList.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(20),
                  height: MediaQuery.sizeOf(context).height * 0.20,
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        "${controller.likeList[index].quotes}",
                        style:
                            const TextStyle(fontSize: 16, fontFamily: "Medium"),
                      ),
                      const Divider(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            DBHelper db = DBHelper();
                            db.quotesDelete(
                                id: "${controller.likeList[index].id}");
                            controller.getData();
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
