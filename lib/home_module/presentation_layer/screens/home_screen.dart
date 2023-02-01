import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/authentication_module/presentation_layer/widgets/text_widget.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/widgets/categories_section.dart';
import 'package:e_commerce_app/home_module/presentation_layer/widgets/grid_view_products.dart';
import 'package:e_commerce_app/home_module/presentation_layer/widgets/top_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state is GetDataLoadingState)
              circularProgress(),
            
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 35),
                child:  CustomSlider(
                    model: BlocProvider.of<HomeCubit>(context).homeModel),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const TextWidget(
                      text: AppStrings.categories,
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      lines: 1,
                      alignment: Alignment.topLeft,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state is GetCategoryLoadingState)
           circularProgress(),
                    CategoriesSection(
                        model: BlocProvider.of<HomeCubit>(context)
                            .categoriesModel),
                    
                    GridViewProducts(
                        model: BlocProvider.of<HomeCubit>(context).homeModel),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
