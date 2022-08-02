import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/presentation/common/widgets/empty.dart';
import 'package:news_test_project/presentation/features/details/mappers/article_domain_to_article_details_model.dart';
import 'package:news_test_project/presentation/features/details/pages/details_page.dart';
import 'package:news_test_project/presentation/features/main/widgets/article_card.dart';
import 'package:news_test_project/presentation/features/main/widgets/mappers/article_domain_to_article_card_model.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_bloc.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_state.dart';

class SortedContainer extends StatelessWidget {
  const SortedContainer({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingBloc, SortingState>(
        buildWhen: (oldState, newState) =>
            oldState.isDescSorting != newState.isDescSorting,
        builder: (context, state) {
          final sortedArticles = state.sorter.sort(articles);
          return (sortedArticles.isNotEmpty
              ? Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              final model = sortedArticles[index];

                              return ArticleCard(
                                model: model.toArticleCardModel(),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    DetailsPage.navigationPath,
                                    arguments: model.toArticleDetailsModel(),
                                  );
                                },
                              );
                            },
                            itemCount: sortedArticles.length),
                      ),
                    ],
                  ),
                )
              : const Expanded(
                  child: Empty(),
                ));
        });
  }
}
