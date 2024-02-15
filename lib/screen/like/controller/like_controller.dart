import 'package:get/get.dart';

import '../../../utils/db_helper.dart';
import '../../model/db_model.dart';

class LikeController extends GetxController
{
  RxList<DbModel> likeList = <DbModel>[].obs;

  Future<void> getData() async {
    DBHelper helper = DBHelper();
    List<DbModel> data = await helper.readQuotes();
    likeList.value = data;
  }
}