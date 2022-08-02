import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/domain/models/article.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_event.dart';
import 'package:news_test_project/presentation/features/filtering/bloc/filtering_state.dart';

class FilteringBloc extends Bloc<FilteringEvent, FilteringState> {
  FilteringBloc({
    required List<Article> sourceArticles,
  }) : super(FilteringState(
          sourceArticles: sourceArticles,
          filteredArticles: sourceArticles,
        )) {
    on<ApplyFilterEvent>(_onFilterApply);
  }

  void _onFilterApply(
      ApplyFilterEvent event, Emitter<FilteringState> emit) async {
    emit(
      state.copyWith(
        filter: event.filter,
        filteredArticles: await event.filter.apply(
          Future.value(state.sourceArticles),
        ),
      ),
    );
  }
}
