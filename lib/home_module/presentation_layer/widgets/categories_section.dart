// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/home_module/domain_layer/entities/categories.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/screens/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';

class CategoriesSection extends StatelessWidget {
  final model;
  const CategoriesSection({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              categoriesWidget(model[index], index, context),
          separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
          itemCount: model.length),
    );
  }
}

Widget categoriesWidget(Categories model, int index, context) {
  return InkWell(
    onTap: () async {
     
        push(context: context, screen: BlocProvider(
                    create: (context) => sl<HomeCubit>()..getCategoriesDetails(categoryId: model.id,),
                    child: const CategoryDetails(),
                  ),);
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: AppColors.myWhite,
          ),
          child: TextWidget(
            text: model.name,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            lines: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: NetworkImage(model.image),
          fit: BoxFit.cover,
          width: 110,
          height: 80,
        ),
      ],
    ),
  );
}
