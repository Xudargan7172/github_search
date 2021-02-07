part of 'result_bloc.dart';

@immutable
abstract class ResultState {}

class ResultInitial extends ResultState {}

class LoadingState extends ResultState {
  final Repositorie repoList;

  LoadingState(this.repoList);
}

class LoadedState extends ResultState {
  final Repositorie repoList;

  LoadedState(this.repoList);
}