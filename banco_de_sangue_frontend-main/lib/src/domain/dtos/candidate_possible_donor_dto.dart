// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CandidatePossibleDonorDto {
  final String tipoSanguineo;
  final int quantidade;
  CandidatePossibleDonorDto({
    required this.tipoSanguineo,
    required this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tipo_sanguineo': tipoSanguineo,
      'quantidade': quantidade,
    };
  }

  factory CandidatePossibleDonorDto.fromMap(Map<String, dynamic> map) {
    return CandidatePossibleDonorDto(
      tipoSanguineo: map['tipo_sanguineo'] as String,
      quantidade: map['quantidade'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidatePossibleDonorDto.fromJson(String source) => CandidatePossibleDonorDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CandidatePossibleDonorDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.tipoSanguineo == tipoSanguineo &&
      other.quantidade == quantidade;
  }

  @override
  int get hashCode => tipoSanguineo.hashCode ^ quantidade.hashCode;
}
