import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/presentation/business_logic/car_spare_parts_cubit/car_spare_by_parts_cubit.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/assets_path/lottie_path.dart';
import '../../widgets/spare_parts/spare_parts_intro_container.dart';
import '../../widgets/spare_parts/spare_parts_item_widget.dart';

class SpareByPartsScreen extends StatelessWidget {
  const SpareByPartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return Scaffold(
      body: BlocConsumer<CarSparePartsCubit, CarSparePartsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<CarSparePartsCubit>();
          return Stack(
            children: [
              SparePartsIntroContainer(
                carSparePartsCubit: cubit,
              ),
              Container(
                margin: EdgeInsets.only(top: 200.h),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: state is GetCarSparePartsLoading
                    ? Center(
                        child: Lottie.asset(
                          LottiePath.loading,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ScreenName.sparePartsDetailsScreen,
                              arguments: [cubit.sparePartsList[index]],
                            );
                          },
                          child: SparePartsItemWidget(
                            carSparePartModel: cubit.sparePartsList[index],
                            messenger: messenger,
                          ),
                        ),
                        separatorBuilder: (_, index) {
                          return const CustomSizedBox(height: 16);
                        },
                        itemCount: cubit.sparePartsList.length,
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
