import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List<dynamic> properties = const <dynamic> []]);

  @override
  List<Object> get props => [];
}