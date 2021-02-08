part of 'result_bloc.dart';

@immutable
abstract class ResultEvent {
}

class LoadingEvent extends ResultEvent {}

class SendRequestEvent extends ResultEvent {
  final String repoName;

  SendRequestEvent({this.repoName}) : assert(repoName != null);
}

class NextPageEvent extends ResultEvent {
  final String repoName;
  int page;
  bool isLoading;

  NextPageEvent({this.repoName, this.page, this.isLoading});
}

