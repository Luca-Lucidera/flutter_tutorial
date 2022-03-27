import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String? id;
  final String? email;
  final String? nome;
  final String? cognome;
  final String? citta;
  final String? datanascita;
  final String? interessi;
  final String? datacreazione;
  final int? rating;
  final String? immagineurl;
  final String token;

  User({
    this.id,
    this.email,
    this.nome,
    this.cognome,
    this.citta,
    this.datanascita,
    this.interessi,
    this.datacreazione,
    this.rating,
    this.immagineurl,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
