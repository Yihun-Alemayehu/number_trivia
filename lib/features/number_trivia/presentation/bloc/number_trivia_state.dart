part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
  
  @override
  List<Object> get props => [];
}

class NumberTriviaInitial extends NumberTriviaState {}

class NumberTriviaLoading extends NumberTriviaState {}

class NumberTriviaLoaded extends NumberTriviaState{
  final NumberTriviaEntity numberTrivia;

  const NumberTriviaLoaded({required this.numberTrivia});

  @override
  List<Object> get props => [numberTrivia];

}

class NumberTriviaError extends NumberTriviaState{
  final String errorMessage;

  const NumberTriviaError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}