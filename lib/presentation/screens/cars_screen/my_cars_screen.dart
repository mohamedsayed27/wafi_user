import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wafi_user/core/app_router/screens_name.dart';
import 'package:wafi_user/core/app_theme/custom_themes.dart';
import 'package:wafi_user/presentation/business_logic/cars_cubit/cars_cubit.dart';
import 'package:wafi_user/presentation/widgets/cars_widget/my_car_widget.dart';
import 'package:wafi_user/presentation/widgets/shared_widgets/custom_sized_box.dart';

import '../../../core/services/services_locator.dart';

class MyCarsScreen extends StatelessWidget {
  const MyCarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CarsCubit>()..getMyCars(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(
                top: 80.h,
                bottom: 15.h,
                start: 16.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffE86950),
                    Color(0xffFB154B),
                    Color(0xff920E92),
                    Color(0xff910E93),
                  ],
                  stops: [0, 0.40, 0.68, 1],
                  begin: Alignment(-0.9, -0.9),
                  end: Alignment(1.0, 1.0),
                ),
              ),
              child: Text(
                "My Cars",
                style: CustomThemes.whiteColoTextTheme(context).copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocBuilder<CarsCubit, CarsState>(
              builder: (context, state) {
                CarsCubit cubit = sl<CarsCubit>();
                return Expanded(
                  child: state is GetMyCarsListLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                          itemBuilder: (context, index) {
                            return MyCarWidget(
                              model: cubit.carsList[index],
                              onRemovePressed: () {},
                              onEditPressed: () {
                                cubit.initProducts(cubit.carsList[index]);
                                Navigator.pushNamed(context, ScreenName.addYorCar);
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const CustomSizedBox(
                              height: 16,
                            );
                          },
                          itemCount: cubit.carsList.length,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
