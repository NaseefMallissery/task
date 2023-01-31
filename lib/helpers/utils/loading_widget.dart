
import 'package:flutter/cupertino.dart';
import 'package:infinity_box_assignment/helpers/constant/app_styles.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: AppColors. redColor,
        size: 33,
        secondRingColor: AppColors.redColor,
        thirdRingColor: AppColors.greyColor,
      ),
    );
  }
}
