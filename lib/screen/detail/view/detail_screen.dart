import 'package:db_miner/screen/home/controller/home_controller.dart';
import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/screen/model/db_model.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller=Get.put(HomeController());
  HomeModel model = Get.arguments;

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
          children: [
            Obx(
              () =>  Image.asset(
                controller.isLight.value?"assets/image/bg1.jpeg":'assets/image/bg2.jpg',
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Obx(
                  () => controller.isLight.value?Container(): Container(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: model.quotes?.length,
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 100,),
                          Center(
                            child: Text(
                              "${model.quotes![index]}",
                              style: const TextStyle(
                                  fontFamily: 'Medium',
                                  fontSize: 23),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Center(
                            child: Text(
                              "${model.author![index]}",
                              style: const TextStyle(
                                  fontFamily: 'Italic',
                                  fontSize: 17),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.share),
                              ),
                              IconButton(
                                onPressed: () {
                                  DbModel dbModel = DbModel(
                                    category: model.category,
                                    author: model.author![index],
                                    quotes: model.quotes![index],
                                  );
                                  DBHelper db = DBHelper();
                                  db.insertData(dbModel);
                                },
                                icon: const Icon(CupertinoIcons.hand_thumbsup),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              CupertinoIcons.table_badge_more,
                            ),
                            Text(
                              "General",
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        width: MediaQuery.sizeOf(context).width * 0.10,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.imagesearch_roller_outlined,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("setting");
                        },
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                          width: MediaQuery.sizeOf(context).width * 0.10,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            CupertinoIcons.person,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
