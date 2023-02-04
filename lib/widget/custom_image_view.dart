import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class CustomImageView extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double cornerRadius;
  final bool isHorizontalCard;
  final String fallBackText;
  final double fontSize;
  final BoxFit fit;
  const CustomImageView(
      {Key? key,
      required this.url,
      this.width = 100.0,
      this.height = 100.0,
      this.cornerRadius = 100.0,
      this.isHorizontalCard = false,
      required this.fallBackText,
      this.fontSize = 22.0,
      this.fit = BoxFit.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
          borderRadius: isHorizontalCard
              ? BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  bottomLeft: Radius.circular(cornerRadius))
              : BorderRadius.circular(cornerRadius),
          child: CachedNetworkImage(

            imageUrl: url,
            fit: fit,
            progressIndicatorBuilder: (context, str, loadingProgress) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.grey[500],
                value: loadingProgress.totalSize != null
                    ? loadingProgress.downloaded / loadingProgress.totalSize!
                    : null,
              ));
            },
            errorWidget: (context, str, errorWidget) {
              var placeHolder = "";
              if (fallBackText.trim().isNotEmpty) {
                var nameWithSpaces = fallBackText.trim().split(' ');
                if (nameWithSpaces.length > 1) {
                  placeHolder =
                      "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces[1][0].toUpperCase()}";
                } else {
                  placeHolder =
                      "${nameWithSpaces.first[0].toUpperCase()}${nameWithSpaces.first[1].toUpperCase()}";
                }
              }

              return Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: placeHolder.trim().isEmpty
                    ? const Icon(Icons.person_rounded)
                    : MyText(
                        text: placeHolder,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600),
              );
            },
          )),
    );
  }
}
