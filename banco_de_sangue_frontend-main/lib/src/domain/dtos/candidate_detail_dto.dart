import 'dart:convert';

import 'package:flutter/foundation.dart';

class CandidateDetailDto {
  final String id;
  final String nome;
  final String cpf;
  final String rg;
  final List<dynamic> dataNasc;
  final String sexo;
  final String mae;
  final String pai;
  final String email;
  final String cep;
  final String endereco;
  final int numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String telefoneFixo;
  final String celular;
  final double altura;
  final double peso;
  final String tipoSanguineo;
  CandidateDetailDto({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.rg,
    required this.dataNasc,
    required this.sexo,
    required this.mae,
    required this.pai,
    required this.email,
    required this.cep,
    required this.endereco,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.telefoneFixo,
    required this.celular,
    required this.altura,
    required this.peso,
    required this.tipoSanguineo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'rg': rg,
      'data_nasc': dataNasc,
      'sexo': sexo,
      'mae': mae,
      'pai': pai,
      'email': email,
      'cep': cep,
      'endereco': endereco,
      'numero': numero,
      'bairro': bairro,
      'cidade': cidade,
      'estado': estado,
      'telefone_fixo': telefoneFixo,
      'celular': celular,
      'altura': altura,
      'peso': peso,
      'tipo_sanguineo': tipoSanguineo,
    };
  }

  factory CandidateDetailDto.fromMap(Map<String, dynamic> map) {
    return CandidateDetailDto(
      id: map['id'] as String,
      nome: map['nome'] as String,
      cpf: map['cpf'] as String,
      rg: map['rg'] as String,
      dataNasc: List<dynamic>.from((map['data_nasc'] as List<dynamic>)),
      sexo: map['sexo'] as String,
      mae: map['mae'] as String,
      pai: map['pai'] as String,
      email: map['email'] as String,
      cep: map['cep'] as String,
      endereco: map['endereco'] as String,
      numero: map['numero'] as int,
      bairro: map['bairro'] as String,
      cidade: map['cidade'] as String,
      estado: map['estado'] as String,
      telefoneFixo: map['telefone_fixo'] as String,
      celular: map['celular'] as String,
      altura: map['altura'] as double,
      peso: map['peso'] as double,
      tipoSanguineo: map['tipo_sanguineo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidateDetailDto.fromJson(String source) => CandidateDetailDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CandidateDetailDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.nome == nome &&
      other.cpf == cpf &&
      other.rg == rg &&
      listEquals(other.dataNasc, dataNasc) &&
      other.sexo == sexo &&
      other.mae == mae &&
      other.pai == pai &&
      other.email == email &&
      other.cep == cep &&
      other.endereco == endereco &&
      other.numero == numero &&
      other.bairro == bairro &&
      other.cidade == cidade &&
      other.estado == estado &&
      other.telefoneFixo == telefoneFixo &&
      other.celular == celular &&
      other.altura == altura &&
      other.peso == peso &&
      other.tipoSanguineo == tipoSanguineo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      cpf.hashCode ^
      rg.hashCode ^
      dataNasc.hashCode ^
      sexo.hashCode ^
      mae.hashCode ^
      pai.hashCode ^
      email.hashCode ^
      cep.hashCode ^
      endereco.hashCode ^
      numero.hashCode ^
      bairro.hashCode ^
      cidade.hashCode ^
      estado.hashCode ^
      telefoneFixo.hashCode ^
      celular.hashCode ^
      altura.hashCode ^
      peso.hashCode ^
      tipoSanguineo.hashCode;
  }
}
