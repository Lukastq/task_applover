import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:applover/core/presentation/theme/app_colors.dart';

class ApploverLogo extends StatelessWidget {
  const ApploverLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/applover.svg',
      fit: BoxFit.fill,
      color: AppColors.white,
    );
  }
}
