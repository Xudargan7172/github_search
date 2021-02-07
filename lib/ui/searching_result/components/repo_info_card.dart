import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_search/models/repositorie.dart';

class RepoInfoCard extends StatelessWidget {
  final Repositorie repositorie;
  int index;

  RepoInfoCard({Key key, this.repositorie, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Color(0xFFDFDFDF),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(repositorie.items[index].name),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFA6A6A6),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    child:  Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          repositorie.items[index].stargazersCount.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          repositorie.items[index].owner.avatarUrl),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(repositorie.items[index].owner.login),
              ],
            ),
            Divider(
              height: 15,
              color: Color(0xFFDFDFDF),
            ),
            RichText(
              text: TextSpan(
                text: "Обновлено: ",
                style: TextStyle(
                  color: Color(0xFFA6A6A6),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${repositorie.items[index].updatedAt}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
