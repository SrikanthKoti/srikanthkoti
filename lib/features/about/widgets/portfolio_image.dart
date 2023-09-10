import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:srikanthkoti/features/home/widgets/bottom_clipped_blob.dart';

class PortfolioImage extends StatelessWidget {
  const PortfolioImage({
    super.key,
  });
  double getScale(BuildContext context) {
    bool isMobile =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
    bool isTablet =
        getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.tablet;
    if (isMobile) {
      return 1;
    }
    if (isTablet) {
      return 1;
    }
    if (MediaQuery.of(context).size.width <= 1200) {
      return 1.2;
    }
    return 1.8;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Transform.scale(
        //   scale: getScale(context),
        //   child: const BottomClipInspirationExample(),
        // ),
      ],
    );
  }
}
