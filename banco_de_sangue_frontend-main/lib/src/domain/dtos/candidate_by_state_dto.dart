import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CandidateByStateDto {
  final String estado;
  final int quantidade;
  CandidateByStateDto({
    required this.estado,
    required this.quantidade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'estado': estado,
      'quantidade': quantidade,
    };
  }

  factory CandidateByStateDto.fromMap(Map<String, dynamic> map) {
    return CandidateByStateDto(
      estado: map['estado'] as String,
      quantidade: map['quantidade'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CandidateByStateDto.fromJson(String source) => CandidateByStateDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant CandidateByStateDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.estado == estado &&
      other.quantidade == quantidade;
  }

  @override
  int get hashCode => estado.hashCode ^ quantidade.hashCode;
}
