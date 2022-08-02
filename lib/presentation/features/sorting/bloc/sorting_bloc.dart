import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/domain/models/sorting/article_sorter_by_date.dart';
import 'package:news_test_project/domain/models/sorting/article_sorter_by_date_desc.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_event.dart';
import 'package:news_test_project/presentation/features/sorting/bloc/sorting_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingState> {
  SortingBloc({
    required bool sortByDesc,
  }) : super(SortingState(
          isDescSorting: sortByDesc,
        )) {
    on<ChangeSortDirectionEvent>(_onSortDirectionChanged);
  }

  FutureOr<void> _onSortDirectionChanged(
      ChangeSortDirectionEvent event, Emitter<SortingState> emit) {
    final isDescSorting = !state.isDescSorting;
    emit(
      state.copyWith(
        isDescSorting: isDescSorting,
        sorter:
            isDescSorting ? ArticleSorterByDateDesc() : ArticleSorterByDate(),
      ),
    );
  }
}
