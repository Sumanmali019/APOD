import 'package:apod_app/app/utils/imag_const.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: PageView.builder(
            // controller: PageController(viewportFraction: 1),
            onPageChanged: (value) async {
              await controller.psginateData(value);
            },
            scrollDirection: Axis.vertical,
            itemCount: controller.apodData.length,
            itemBuilder: ((context, index) {
              return Stack(
                children: [
                  SizedBox(
                    height: Get.height,
                    child: CachedNetworkImage(
                      filterQuality: FilterQuality.low,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: Colors.grey,
                      )),
                      errorWidget: (context, url, error) => SizedBox(
                        child: Image.asset(
                          ImageConst.nullimage,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      memCacheHeight: Get.height.toInt(),
                      memCacheWidth: Get.width.toInt(),
                      imageUrl: controller.apodData[index].url ?? '',
                      fit: BoxFit.fitHeight,
                    ).animate().shimmer(color: Colors.grey).fade(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRect(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black12,
                              Colors.black26,
                              Colors.black38,
                              Colors.black45,
                              Colors.black54,
                              Colors.black87,
                              Colors.black,
                            ],
                          ),
                        ),
                        height: Get.height * 0.8,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20.0, left: 16, right: 16),
                            child: Text(controller.apodData[index].title ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26))
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 600),
                                    curve: Curves.easeOut)
                                .scaleXY(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20.0, left: 16, right: 16),
                            child: ExpandableText(
                              animation: true,
                              controller.apodData[index].explanation ?? '',
                              expandText: 'See more',
                              collapseText: 'See less',
                              maxLines:
                                  2, // Adjust the number of lines to show initially
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              animationCurve: Curves.easeOut,
                              animationDuration:
                                  const Duration(milliseconds: 750),
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 600),
                                    curve: Curves.easeOut)
                                .scaleXY(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: Text(
                              controller.apodData[index].date ?? '',
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 12),
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 600),
                                    curve: Curves.easeOut)
                                .scaleXY(),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16, top: 20),
                            child: Text(
                              ' © ${controller.apodData[index].copyright?.replaceAll('\n', ' ') ?? 'Nasa'}'
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                                .animate()
                                .fadeIn(
                                    delay: const Duration(milliseconds: 800),
                                    curve: Curves.easeOut)
                                .scaleXY(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
