import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/bloc/result_bloc.dart';
import 'package:github_search/constants.dart';

import 'components/repo_info_card.dart';

class SearchResultScreen extends StatefulWidget {
  final String repoName;

  const SearchResultScreen({Key key, this.repoName}) : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final controller = ScrollController();
  int page = 1;
  ResultBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<ResultBloc>(context);
    controller.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (bloc.state is LoadedState == false) return;
    if (!controller.hasClients) return;
    final double maxHeight = controller.position.maxScrollExtent;
    final double currentHeight = controller.offset;
    if (currentHeight >= maxHeight * 0.85) {
      bloc.add(
        NextPageEvent(
          repoName: widget.repoName,
          page: ++page,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Поиск".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 19,
          ),
          RichText(
            text: TextSpan(
              text: "По запросу: ".toUpperCase(),
              style: TextStyle(
                color: kTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.repoName.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          BlocBuilder<ResultBloc, ResultState>(builder: (context, state) {
            if (state is ResultInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedState) {
              return Expanded(
                child: Column(
                  children: [
                    Text(
                      "Найдено: ${state.repoList.totalCount}".toUpperCase(),
                      style: TextStyle(
                        color: kTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: state.repoList.items.length,
                        itemBuilder: (context, index) => RepoInfoCard(
                          repositorie: state.repoList,
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is LoadingState) {
              return Expanded(
                child: Column(
                  children: [
                    Text(
                      "Найдено: ${state.repoList.totalCount}".toUpperCase(),
                      style: TextStyle(
                        color: kTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: state.repoList.items.length,
                        itemBuilder: (context, index) => RepoInfoCard(
                          repositorie: state.repoList,
                          index: index,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
        ],
      ),
    );
  }
}
