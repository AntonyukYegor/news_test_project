import 'package:flutter/material.dart';
import 'package:news_test_project/presentation/common/widgets/error.dart';
import 'package:news_test_project/presentation/common/widgets/loading.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(this.pictureUrl, {this.fit = BoxFit.fitHeight, Key? key})
      : super(key: key);

  final String pictureUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      pictureUrl,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstChild: child,
          secondChild: const AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: Loading(),
            ),
          ),
          crossFadeState: loadingProgress == null
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        );
      },
      errorBuilder: (BuildContext context, _, __) {
        return const AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Error(),
          ),
        );
      },
      fit: fit,
    );
  }
}
