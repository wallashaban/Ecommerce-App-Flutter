// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/home.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/produc_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';

import '../../../core/utils/app_constants.dart';

class GridViewProducts extends StatelessWidget {
  int index = 0;
  final Home model;
  GridViewProducts({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.myWhite),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const TextWidget(
            text: AppStrings.products,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            lines: 1,
            alignment: Alignment.topLeft,
          ),
          const SizedBox(
            height: 5,
          ),
          GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 1 / 1.6,
              scrollDirection: Axis.vertical,
              children: List.generate(model.products.length, (index) {
                return productWidget(model.products[index], context, index);
              })),
        ],
      ),
    );
  }
}

Widget productWidget(
  Products model,
  context,
  int index,
) =>
    InkWell(
      onTap: (() {
        BlocProvider.of<HomeCubit>(context)
            .getProductDetails(
          productId: model.id,
        )
            .then((value) {
          push(
            context: context,
            screen: ProductDetails(model: model),
          );
        });
      }),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).addOrDeleteFavourites(
                    productId: model.id,
                  );
                },
                icon: const Icon(
                  Icons.favorite,
                ),
                color:
                    BlocProvider.of<HomeCubit>(context).inFavourites[model.id]!
                        ? AppColors.textBodyMediumColor
                        : AppColors.primaryColor,
              ),
              IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).addOrDeleteFromCart(
                    productId: model.id,
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                color:
                    BlocProvider.of<HomeCubit>(context).inCarts[model.id]!
                            ? AppColors.textBodyMediumColor
                            :
                    AppColors.primaryColor,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Image(
            image: NetworkImage(model.image),
            fit: BoxFit.cover,
            height: 170,
          ),
          //const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextWidget(
                  text: model.name,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                  text: model.price.toString(),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  lines: 1,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ],
      ),
    );
