import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_test_project/data/mappers/date_time_to_short_string.dart';
import 'package:news_test_project/data/models/ios_repository_request.dart';
import 'package:news_test_project/domain/repositories/articles_repository.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_event.dart';
import 'package:news_test_project/presentation/features/main/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ArticlesRepository _repository;

  MainBloc({
    required ArticlesRepository repository,
  })  : _repository = repository,
        super(MainState(publishDate: DateTime.now())) {
    on<LoadDataEvent>(_onLoadData);
    on<PublishDateChangedEvent>(_onPublishDateChangedEvent);
  }

  FutureOr<void> _onLoadData(LoadDataEvent event, Emitter<MainState> emit) {
    emit(
      state.copyWith(
        data: _repository.getArticles(
          IOSRepositoryRequest(releaseDate: state.publishDate),
        ),
      ),
    );
  }

  FutureOr<void> _onPublishDateChangedEvent(
    PublishDateChangedEvent event,
    Emitter<MainState> emit,
  ) {
    if (event.date.toShort() != state.publishDate.toShort()) {
      emit(
        state.copyWith(
          publishDate: event.date,
          data: _repository.getArticles(
            IOSRepositoryRequest(releaseDate: event.date),
          ),
        ),
      );
    }
  }
}
