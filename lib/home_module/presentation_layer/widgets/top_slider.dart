import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';

class CustomSlider extends StatelessWidget {
 final Home model;
  const CustomSlider({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: model.banners
          .map((e) => Image(
                image: NetworkImage(
                  e.image,
                ),
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        height: 150.0,
        enableInfiniteScroll: true,
        initialPage: 0,
        reverse: false,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1.0,
      ),
    );
  }
}
