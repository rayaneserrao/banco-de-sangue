import 'dart:io';

import 'package:banco_de_sangue/src/domain/dtos/candidate_age_blood_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_by_state_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_detail_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_imc_by_age_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_possible_donor_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_register_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_sex_obsessed_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class CandidatoRepository {
  AsyncResult<List<CandidateRegisterDto>> registerCandidates(File arquivo);
  AsyncResult<List<CandidateDetailDto>> listPossiblesCandidates();
  AsyncResult<List<CandidateImcByAgeDto>> averageImcByAgeRange();
  AsyncResult<List<CandidateByStateDto>> countCandidatesByState();
  AsyncResult<List<CandidateSexObsessedDto>> countObeseBySex();
  AsyncResult<List<CandidateAgeBloodDto>> averageAgeByBloodType();
  AsyncResult<List<CandidatePossibleDonorDto>> countPossibleDonors();
}
