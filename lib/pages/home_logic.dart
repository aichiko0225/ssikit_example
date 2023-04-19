import 'package:get/get.dart';

class HomeLogic extends GetxController {
  // var count = 0;
  RxInt count = 0.obs;
  void increase(){
    count++;
    update();
  }
}