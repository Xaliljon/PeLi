import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:peli/utils/device_size_config.dart';

peliSpinner() {
  return SizedBox(
    height: SizeConfig.calculateBlockVertical(120),
    child: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40,
          child: SvgPicture.asset('assets/svg/soliq_logo_icon.svg'),
        ),
        Lottie.asset('assets/lottie/spinner.json'),
      ],
    ),
  );
}
