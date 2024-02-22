import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  final MockNumberTriviaRepository mockNumberTriviaRepository = MockNumberTriviaRepository();
  final GetConcreteNumberTrivia usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  setUp(() {
    
    
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTriviaEntity(text: 'test', number: 1);

  test('should get trivia for the number from the repository', 
  () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber))
      .thenAnswer((_)  async => Right(tNumberTrivia));
    //act 
    final result = await usecase(Params(number: tNumber));
    //assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
