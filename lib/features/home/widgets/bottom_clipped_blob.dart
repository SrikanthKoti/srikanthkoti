import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/app_images.dart';

class BottomClipInspirationExample extends StatelessWidget {
  const BottomClipInspirationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Blob.fromID(
            id: const ['9-7-3291'],
            size: 350,
            styles: BlobStyles(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            width: 350,
            child: ClipPath(
              clipper: MyClipper(),
              child: Image.asset(
                AppImages.portfolioImage,
                alignment: Alignment.bottomCenter,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var blobData = BlobGenerator(
      id: '9-7-3291',
      size: size,
    ).generate();

    var sqPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height / 2));
    var blobPath = connectPoints(blobData.curves!);

    return Path.combine(PathOperation.union, blobPath, sqPath);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
