import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/shared_helper.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("setting"),
          centerTitle: true,
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Obx(() =>  Image.asset(controller.isLight.value?"assets/image/bg3.jpg":"assets/image/bg2.jpg",fit: BoxFit.cover,height: double.infinity,)),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.90,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.imagesearch_roller_outlined),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Theme",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Obx(
                          () => Switch(
                            value: controller.isLight.value,
                            onChanged: (value1) {
                              SharedHelper shr = SharedHelper();
                              shr.setTheme(value1);
                              controller.changeTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Get.toNamed("like");
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.save_alt),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Liked Quotes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
