import 'package:flutter/material.dart';
import 'package:github_search/bloc/result_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/constants.dart';

import '../searching_result/search_result_screen.dart';

class HomeScreen extends StatelessWidget {
  final _searchController = TextEditingController();
  String _repoName;

  @override
  Widget build(BuildContext context) {
    ResultBloc _bloc = BlocProvider.of<ResultBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Поиск".toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 1.5),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 84, right: 16, left: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 1,
              color: kBorderColor,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: _searchController,
                    cursorColor: kTextColor,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      border: InputBorder.none,
                      // hintText: 'Поиск репозитории',
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (_searchController.text != null) {
                    _repoName = _searchController.text;
                    print(_repoName);
                    _bloc.add(SendRequestEvent(repoName: _repoName));
                    if (_repoName != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultScreen(repoName: _repoName),
                        ),
                      );
                    }
                  }
                },
                child: Container(
                  width: 100,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      "НАЙТИ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
