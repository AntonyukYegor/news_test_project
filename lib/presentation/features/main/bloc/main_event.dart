import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class PublishDateChangedEvent extends MainEvent {
  final DateTime date;

  const PublishDateChangedEvent({
    required this.date,
  });

  @override
  List<Object> get props => [date];
}

class LoadDataEvent extends MainEvent {}
