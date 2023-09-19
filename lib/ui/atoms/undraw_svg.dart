library ms_undraw;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnDraw extends StatelessWidget {
  const UnDraw(
      {Key? key,
      required this.svgPath,
      required this.color,
      this.semanticLabel,
      this.alignment = Alignment.center,
      this.fit = BoxFit.contain,
      this.colorBlendMode = BlendMode.srcIn,
      this.height,
      this.width,
      this.placeholder,
      this.errorWidget,
      this.padding,
      this.useMemCache = true,
      this.defaultHexColorInSvg = '6c63ff'})
      : super(key: key);

  /// The color that will replaced for illustration
  final Color color;
  final String svgPath;

  /// The [Semantics.label] for this picture.
  ///
  /// The value indicates the purpose of the picture, and will be
  /// read out by screen readers.
  final String? semanticLabel;

  /// How to align the picture within its parent widget.
  ///
  /// The alignment aligns the given position in the picture to the given position
  /// in the layout bounds. For example, an [Alignment] alignment of (-1.0,
  /// -1.0) aligns the image to the top-left corner of its layout bounds, while a
  /// [Alignment] alignment of (1.0, 1.0) aligns the bottom right of the
  /// picture with the bottom right corner of its layout bounds. Similarly, an
  /// alignment of (0.0, 1.0) aligns the bottom middle of the image with the
  /// middle of the bottom edge of its layout bounds.
  ///
  /// If the [alignment] is [TextDirection]-dependent (i.e. if it is a
  /// [AlignmentDirectional]), then a [TextDirection] must be available
  /// when the picture is painted.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  /// How to inscribe the picture into the space allocated during layout.
  /// The default is [BoxFit.contain].
  final BoxFit fit;

  /// The `color` and `colorBlendMode` arguments, if specified, will be used to set a
  /// [ColorFilter] on any [Paint]s created for this drawing.
  final BlendMode colorBlendMode;

  /// If specified, the width to use for the SVG.  If unspecified, the SVG
  /// will take the width of its parent.
  final double? width;

  /// If specified, the height to use for the SVG.  If unspecified, the SVG
  /// will take the height of its parent.
  final double? height;

  /// The widget that will appear during loading illustration from the internet
  final Widget? placeholder;

  /// The widget that will appear if occurs an error
  final Widget? errorWidget;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  ///
  /// This padding is in addition to any padding inherent in the [decoration];
  /// see [Decoration.padding].
  final EdgeInsets? padding;

  /// If cache image in memory, if enable reload the same illustration is be more fast
  final bool useMemCache;
  final String defaultHexColorInSvg;
  Future<SvgPicture> renderIllustration(String svgPath, Color _exColor) async {
    String image = await _getSvgString(svgPath);

    String valueString = color.toString().split('(0x')[1].split(')')[0];
    valueString = valueString.substring(2, valueString.length);
    image = image.replaceAll("#" + defaultHexColorInSvg, "#" + valueString);
    return SvgPicture.string(
      image,
      height: height,
      width: width,
      alignment: alignment,
      // colorFilter: colorBlendMode,
      fit: fit,
      semanticsLabel: semanticLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: renderIllustration(svgPath, color),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: padding ?? EdgeInsets.all(16),
              child: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: errorWidget ?? Text('Could not load illustration!'),
            );
          } else {
            return Center(
              child: placeholder ?? CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<String> _getSvgString(String url) async {
    final svgCode = await rootBundle.loadString(url);
    return svgCode;
  }
}
