import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/home_module/presentation_layer/controllers/home_cubit.dart';
import 'package:e_commerce_app/home_module/presentation_layer/widgets/grid_view_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication_module/presentation_layer/widgets/text_widget.dart';
import '../../../core/utils/app_constants.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetCategoryDetailsLoadingState) {
            return circularProgress();
          }
           
       return SafeArea(
         child: Container(
          margin: const EdgeInsets.all(20.0),
             decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.myWhite
             ),
             padding: const EdgeInsets.all(8),
             child: SingleChildScrollView(
               child: Column(
                       children: [
                         const TextWidget(text: AppStrings.products, fontSize: 20, fontWeight: FontWeight.bold, lines: 1,
                         alignment: Alignment.topLeft,),
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
                  children: List.generate(BlocProvider.of<HomeCubit>(context).categoryDetails.length, (index) {
                    return productWidget(BlocProvider.of<HomeCubit>(context).categoryDetails[index], context, index);
                  })),
                       ],
               ),
             ),
           ),
       );
    },
      ),
    );
  }
}
