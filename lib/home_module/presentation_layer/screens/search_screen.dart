import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/main_button.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_input.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/products.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/produc_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_colors.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
        //appBar: AppBar(),
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetProductDetailsSearchLoadingState) {
            return circularProgress();
          }
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextInputWidget(
                        verticalPadding: 0,
                        text: 'Find your product',
                        controller: searchController,
                        isPassword: false,
                        action: TextInputAction.done,
                        prefix: Icons.search,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Write something to search about!';
                          }
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MainButton(
                      height: 40,
                      width: 80,
                      text: AppStrings.searchBtn,
                      onClicked: () {
                        cubit.searchProducts(
                          productName: searchController.text,
                        );
                      },
                      textColor: AppColors.myWhite,
                      //btnColor: AppColors.myWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is GetProductDetailsSearchLoadingState)
                const CircularProgressIndicator(
                  color: AppColors.textBodyMediumColor,
                ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) => searchWidget(
                    BlocProvider.of<HomeCubit>(context).searchProduct[index],
                    context,
                    index,
                  ),
                  itemCount: cubit.searchProduct.length,
                ),
              ),
            ],
          );
        },
      ),
    )));
  }
}

Widget searchWidget(Products model, context, int index) => InkWell(
      onTap: () {
        BlocProvider.of<HomeCubit>(context)
            .getProductDetails(
          productId: model.id,
        )
            .then((value) {
          push(context: context, screen: ProductDetails(model: model));
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 5, bottom: 10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(
                model.image,
              ),
              width: 100,
              height: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 15.0,
            ),
            SizedBox(
              width: 200,
              child: Column(
                children: [
                  TextWidget(
                    text: model.name,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    lines: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: '${model.price}LE',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    lines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
