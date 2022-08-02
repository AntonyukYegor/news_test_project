import 'package:equatable/equatable.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();

  @override
  List<Object> get props => [];
}

class ShowDialogEvent extends ErrorEvent {
  final String title;
  final String message;

  const ShowDialogEvent({required this.title, required this.message});

  @override
  List<Object> get props => [title, message];
}
