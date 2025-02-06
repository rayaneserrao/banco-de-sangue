import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CandidateImcByAgeDto {
  final String faixaEtaria;
  final double imcMedio;
  CandidateImcByAgeDto({
    required this.faixaEtaria,
    required this.imcMedio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'faixa_etaria': faixaEtaria,
      'imc_medio': imcMedio,
    };
  }

  factory CandidateImcByAgeDto.fromMap(Map<String, dynamic> map) {
    return CandidateImcByAgeDto(
      faixaEtaria: map['faixa_etaria'] as String,
      imcMedio: map['imc_medio'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidateImcByAgeDto.fromJson(String source) => CandidateImcByAgeDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CandidateImcByAgeDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.faixaEtaria == faixaEtaria &&
      other.imcMedio == imcMedio;
  }

  @override
  int get hashCode => faixaEtaria.hashCode ^ imcMedio.hashCode;
}
