import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/services/services_locator.dart';

class ProductDetails extends StatelessWidget {
  final Products model;
  ProductDetails({super.key, required this.model});
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetProductDetailsLoadingState) {
            return circularProgress();
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.scaffoldColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    child: PageView(
                      controller: pageController,
                      children: List.generate(
                        model.images.length,
                        (index) => Image(
                          image: NetworkImage(
                            model.images[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: model.images.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.textBodyMediumColor,
                      dotHeight: 10,
                      dotWidth: 15,
                      dotColor: AppColors.primaryColor,
                      spacing: 5.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextWidget(
                                text: model.name,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                lines: 3,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            TextWidget(
                              text: '${model.price} LE',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              lines: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: model.description,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          lines: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                       /*  MainButton(
                          text: 'Add to cart',
                          onClicked: () {},
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          btnColor: AppColors.textBodyMediumColor,
                        ), */
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
