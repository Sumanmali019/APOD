import 'package:apod_app/app/services/apiServiceLayer/apod_service.dart';
import 'package:apod_app/app/services/dataModel/apod_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var apodData = <ApodModel>[].obs;

  final count = 0.obs;

  var isDataLoading = true.obs;
  final isExpanded = false.obs;
  final tappedindex = 0.obs;

  final PageController pageController = PageController();
  @override
  void onInit() async {
    apodData.clear();

    await apodLayer();
    super.onInit();
  }

  void increment() => count.value++;

  apodLayer() async {
    try {
      var temp = await ApodCountService().fetchApodImages();
      apodData.addAll(temp);
    } catch (e) {
      //
    }
    isDataLoading.value = false;
  }

  psginateData(int value) async {
    if (value == (apodData.length - 3)) {
      await apodLayer();
    }
  }
}
