import 'package:flutter/material.dart';
import 'package:news_test_project/components/constants.dart';
import 'package:news_test_project/data/mappers/date_time_to_short_with_time_string.dart';
import 'package:news_test_project/presentation/common/widgets/faded_text.dart';
import 'package:news_test_project/presentation/features/main/widgets/models/article_card_model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    required ArticleCardModel model,
    required void Function() onTap,
    Key? key,
  })  : _model = model,
        _onTap = onTap,
        super(key: key);
  final ArticleCardModel _model;
  final void Function() _onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _onTap(),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _model.title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.min,
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
                      Row(
                        children: [
                          Text(
                            AppConstants.publishDate,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Flexible(
                            child: FadedText(
                              _model.releaseDate.toShortWithTime(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
