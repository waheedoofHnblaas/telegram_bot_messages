import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCachImageData extends StatelessWidget {
  const AppCachImageData({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        width: Get.width / 1.5,
        height: Get.width / 1.5,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(33),
          ),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.white, BlendMode.colorBurn),
          ),
        ),
      ),
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) => Container(
        width: 3,
        height: 3,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CircularProgressIndicator(
            value: downloadProgress.progress,
            color: Get.theme.secondaryHeaderColor,
            backgroundColor: Get.theme.primaryColor),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
