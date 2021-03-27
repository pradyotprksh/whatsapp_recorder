import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:product_list/app/app.dart';
import 'package:get/get.dart';

/// A custom network widget which will be usefull to show
/// cached network image based on the needed design.
class NetworkImageWidget extends StatelessWidget {
  /// [imageUrl] : Url of the iamge.
  /// [defaultImage] : A default image if [imageUrl] is not available.
  /// [height] : Height of the widget.
  /// [width] : Width of the widget.
  /// [radiusTopLeft], [radiusTopRight], [radiusBottomLeft]
  /// and [radiusBottomRight] : Radius for the border.
  /// [blurHash] : Blur hash of the image.
  NetworkImageWidget({
    this.imageUrl,
    this.defaultImage,
    this.errorImage,
    this.height,
    this.width,
    this.radiusTopLeft = 0,
    this.radiusTopRight = 0,
    this.radiusBottomLeft = 0,
    this.radiusBottomRight = 0,
    this.blurHash,
  });

  final String imageUrl;
  final String defaultImage;
  final String errorImage;
  final double height;
  final double width;
  final double radiusTopLeft;
  final double radiusTopRight;
  final double radiusBottomLeft;
  final double radiusBottomRight;
  final String blurHash;

  @override
  Widget build(BuildContext context) => (imageUrl.isBlank)
      ? _showOnlyBlurHash()
      : (imageUrl.isURL)
          ? _showBlurHash()
          : _showOnlyBlurHash();

  // Show a blur image
  Widget _showBlurHash() => SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              radiusTopLeft,
            ),
            topRight: Radius.circular(
              radiusTopRight,
            ),
            bottomLeft: Radius.circular(
              radiusBottomLeft,
            ),
            bottomRight: Radius.circular(
              radiusBottomRight,
            ),
          ),
          child: BlurHash(
            hash: blurHash ?? AppConstants.blurHash,
            color: ColorsValue.accentColor,
            image: imageUrl,
            imageFit: BoxFit.cover,
          ),
        ),
      );

  Widget _showOnlyBlurHash() => SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              radiusTopLeft,
            ),
            topRight: Radius.circular(
              radiusTopRight,
            ),
            bottomLeft: Radius.circular(
              radiusBottomLeft,
            ),
            bottomRight: Radius.circular(
              radiusBottomRight,
            ),
          ),
          child: const BlurHash(
            hash: AppConstants.blurHash,
            color: ColorsValue.accentColor,
            imageFit: BoxFit.cover,
          ),
        ),
      );
}
