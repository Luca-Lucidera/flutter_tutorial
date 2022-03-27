// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      email: json['email'] as String?,
      nome: json['nome'] as String?,
      cognome: json['cognome'] as String?,
      citta: json['citta'] as String?,
      datanascita: json['datanascita'] as String?,
      interessi: json['interessi'] as String?,
      datacreazione: json['datacreazione'] as String?,
      rating: json['rating'] as int?,
      immagineurl: json['immagineurl'] as String?,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'cognome': instance.cognome,
      'citta': instance.citta,
      'datanascita': instance.datanascita,
      'interessi': instance.interessi,
      'datacreazione': instance.datacreazione,
      'rating': instance.rating,
      'immagineurl': instance.immagineurl,
      'token': instance.token,
    };
