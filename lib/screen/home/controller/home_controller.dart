import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:db_miner/utils/json_helper.dart';
import 'package:db_miner/utils/shared_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<HomeModel> quotesList = <HomeModel>[].obs;
  RxBool isLight = false.obs;

  //quotes data
  Future<void> getQuotesData() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel> l1 = await jsonHelper.jsonToModel();
    quotesList.value = l1;
  }

  //theme
  void changeTheme() async {
    SharedHelper shr = SharedHelper();
    bool? isTheme = await shr.getTheme();
    isLight.value = isTheme ?? false;
  }
}
