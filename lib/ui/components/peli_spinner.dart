import 'package:flutter/material.dart';
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
          child: Image.asset('assets/logo/peli.png'),
        ),
        Lottie.asset('assets/lottie/spinner.json'),
      ],
    ),
  );
}
