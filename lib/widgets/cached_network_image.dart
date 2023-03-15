import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageBox extends StatefulWidget {
  const CachedNetworkImageBox({
    super.key,
    required this.url,
    required this.builder,
    required this.loaderColor,
  });
  final String url;
  final Color loaderColor;
  final Widget Function(BuildContext, ImageProvider<Object>) builder;
  @override
  State<CachedNetworkImageBox> createState() => _CachedNetworkImageBoxState();
}

class _CachedNetworkImageBoxState extends State<CachedNetworkImageBox> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: widget.builder,
      placeholder: (ctx, url) =>
          CircularProgressIndicator(color: widget.loaderColor),
      errorWidget: (ctx, url, error) => const Icon(Icons.error),
    );
  }
}
