import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_test_project/components/constants.dart';
import 'package:news_test_project/data/mappers/date_time_to_short_with_time_string.dart';
import 'package:news_test_project/presentation/common/widgets/faded_text.dart';
import 'package:news_test_project/presentation/features/details/models/article_details_model.dart';
import 'package:news_test_project/presentation/features/details/widgets/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required ArticleDetailsModel model,
    Key? key,
  })  : _model = model,
        super(key: key);
  final ArticleDetailsModel _model;

  static const String navigationPath = '/detailsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_model.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageNetwork(_model.picture),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      textAlign: TextAlign.center,
                      _model.title,
                      softWrap: true,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppConstants.ownerTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Flexible(
                    child: FadedText(_model.owner),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    AppConstants.publishDate,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Flexible(
                    child: FadedText(_model.releaseDate.toShortWithTime()),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppConstants.articleSourceTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: _model.sourceUrl,
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                              Uri.parse(_model.sourceUrl),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
