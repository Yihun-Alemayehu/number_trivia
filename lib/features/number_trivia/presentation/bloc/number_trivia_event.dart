part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetConcreteNumberTriviaEvent extends NumberTriviaEvent {
  final String numberString;

  const GetConcreteNumberTriviaEvent({required this.numberString});

  @override
  List<Object> get props => [numberString];
}

class GetRandomNumberTriviaEvent extends NumberTriviaEvent {}
