import 'dart:convert';

import 'package:github_search/models/owner.dart';

Repositorie repositorieFromJson(String str) => Repositorie.fromJson(json.decode(str));

String repositorieToJson(Repositorie data) => json.encode(data.toJson());

class Repositorie {
  Repositorie({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int totalCount;
  bool incompleteResults;
  List<Item> items;

  factory Repositorie.fromJson(Map<String, dynamic> json) => Repositorie(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.stargazersCount,
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner owner;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  int stargazersCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: Owner.fromJson(json["owner"]),
    description: json["description"] == null ? null : json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pushedAt: DateTime.parse(json["pushed_at"]),
    stargazersCount: json["stargazers_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner.toJson(),
    "description": description == null ? null : description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pushed_at": pushedAt.toIso8601String(),
    "stargazers_count": stargazersCount,
  };
}
