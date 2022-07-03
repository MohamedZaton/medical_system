import 'package:flutter/material.dart';

import '../core/utils/screens.dart';
import 'flux_image.dart';

class UnderConstructionWidget extends StatelessWidget {
  const UnderConstructionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FluxImage(
            imageUrl: "assets/icons/work_in_progress.png",
            width: ScreenDevices.width(context) * 0.9,
            height: ScreenDevices.heigth(context) * 0.5,
          )
        ],
      ),
    );
  }
}
