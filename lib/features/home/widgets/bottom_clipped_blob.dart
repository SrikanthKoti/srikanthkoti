import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:srikanthkoti/utils/screen_utils.dart';

class BottomClipInspirationExample extends StatelessWidget {
  const BottomClipInspirationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            // color: Colors.green,
            child: Blob.fromID(
              id: ['9-7-3291'],
              size: 300,
              styles: BlobStyles(color: Theme.of(context).primaryColor),
            ),
          ),
          Container(
            // color: Colors.red,
            width: 300,
            child: ClipPath(
              clipper: MyClipper(),
              child: Image.asset(
                "images/0_no_bg.png",
                alignment: Alignment.bottomCenter,
                height: 340,
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
