import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:applover/core/presentation/widgets/applover_logo.dart';
import 'package:applover/core/presentation/widgets/custom_linear_progress_indicator.dart';
import 'package:applover/core/presentation/constants.dart' as constants;


class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double paddingTop = 0.4 * (size.height - 150 - 68);
    final double width = math.min(size.width, constants.maxWidth);

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: width,
            padding: EdgeInsets.only(top: paddingTop),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Hero(
                    tag: "applover",
                    child: ApploverLogo(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: CustomLinearProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
