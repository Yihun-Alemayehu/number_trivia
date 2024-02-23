import 'dart:convert';

import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/number_trivia/data/model/number_trivia_model.dart';
import 'package:http/http.dart';

final http = Client();

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImple
    implements NumberTriviaRemoteDataSource {
  final Client client;

  NumberTriviaRemoteDataSourceImple({required this.client});
  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return NumberTriviaModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException();
    }
  }
}
