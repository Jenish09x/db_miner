import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getQuotesData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quotes"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("setting");
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/image/profile.jpg"),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Obx(
              () => Image.asset(
                controller.isLight.value
                    ? "assets/image/bg3.jpg"
                    : "assets/image/bg2.jpg",
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Obx(
              () => controller.isLight.value?Container(): Container(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            Obx(
              () => Expanded(
                child: GridView.builder(
                  itemCount: controller.quotesList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed("detail",
                          arguments: controller.quotesList[index]);
                    },
                    child: Container(
                      height: 180,
                      width: 180,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey.withOpacity(0.2),
                            Colors.white24
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.quotesList[index].category}",
                            style: const TextStyle(
                                fontFamily: "Medium", fontSize: 20),
                          ),
                          // Image.asset("${controller.quotesList[index].image}"),
                        ],
                      ),
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisExtent: 200),
                ),
              ),
            ),
          ],
        ),
        drawer: const Drawer(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/image/profile.jpg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.settings),
                    Text("Settings"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
