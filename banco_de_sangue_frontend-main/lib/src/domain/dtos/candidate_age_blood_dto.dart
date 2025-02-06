// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CandidateAgeBloodDto {
  final String tipoSanguineo;
  final double idadeMedia;
  CandidateAgeBloodDto({
    required this.tipoSanguineo,
    required this.idadeMedia,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipo_sanguineo': tipoSanguineo,
      'idade_media': idadeMedia,
    };
  }

  factory CandidateAgeBloodDto.fromMap(Map<String, dynamic> map) {
    return CandidateAgeBloodDto(
      tipoSanguineo: map['tipo_sanguineo'] as String,
      idadeMedia: map['idade_media'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidateAgeBloodDto.fromJson(String source) => CandidateAgeBloodDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CandidateAgeBloodDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.tipoSanguineo == tipoSanguineo &&
      other.idadeMedia == idadeMedia;
  }

  @override
  int get hashCode => tipoSanguineo.hashCode ^ idadeMedia.hashCode;
}
