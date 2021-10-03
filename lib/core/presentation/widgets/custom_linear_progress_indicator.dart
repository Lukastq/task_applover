import 'package:applover/core/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  final double height;
  const CustomLinearProgressIndicator({
    Key? key,
    this.height = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green),
        borderRadius: BorderRadius.circular(height),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: LinearProgressIndicator(
          color: AppColors.green,
        ),
      ),
    );
  }
}
