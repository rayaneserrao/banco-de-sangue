// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:banco_de_sangue/src/constants/api_constant.dart';
import 'package:banco_de_sangue/src/data/exceptions/rest_exception.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_age_blood_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_by_state_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_imc_by_age_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_possible_donor_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_register_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_sex_obsessed_dto.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import 'package:banco_de_sangue/src/data/services/client/client_service.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_detail_dto.dart';

import '../../domain/repositories/candidato_repository.dart';

class CandidatoRepositoryImpl implements CandidatoRepository {
  final ClientService clientService;
  CandidatoRepositoryImpl({
    required this.clientService,
  });

  @override
  AsyncResult<List<CandidateImcByAgeDto>> averageImcByAgeRange() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesByImcByAge);
      final List<dynamic> result = response.data;
      final List<CandidateImcByAgeDto> list = result
          .map((item) =>
              CandidateImcByAgeDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidateDetailDto>> listPossiblesCandidates() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesList);
      final List<dynamic> result = response.data;
      final List<CandidateDetailDto> list = result
          .map((item) =>
              CandidateDetailDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidateRegisterDto>> registerCandidates(
      File arquivo) async {
    try {
      String fileContent = await arquivo.readAsString();

      List<dynamic> jsonList = json.decode(fileContent);

      List<CandidateRegisterDto> list = jsonList
          .map((json) =>
              CandidateRegisterDto.fromMap(json as Map<String, dynamic>))
          .toList();

      await clientService.post(
          ApiConstant.candidatesRegister, list.map((candidate) => candidate.toMap()).toList());


      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidateByStateDto>> countCandidatesByState() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesByStates);
      final List<dynamic> result = response.data;
      final List<CandidateByStateDto> list = result
          .map((item) =>
              CandidateByStateDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidateSexObsessedDto>> countObeseBySex() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesBySexObsessed);
      final List<dynamic> result = response.data;
      final List<CandidateSexObsessedDto> list = result
          .map((item) =>
              CandidateSexObsessedDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidateAgeBloodDto>> averageAgeByBloodType() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesByAverageAgeBlood);
      final List<dynamic> result = response.data;
      final List<CandidateAgeBloodDto> list = result
          .map((item) =>
              CandidateAgeBloodDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }

  @override
  AsyncResult<List<CandidatePossibleDonorDto>> countPossibleDonors() async {
    try {
      final Response response =
          await clientService.get(ApiConstant.candidatesByPossibleDonors);
      final List<dynamic> result = response.data;
      final List<CandidatePossibleDonorDto> list = result
          .map((item) =>
              CandidatePossibleDonorDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(list);
    } on DioException catch (e) {
      return Failure(
        RestException(
            message: "Houve um erro!",
            statusCode: e.response?.statusCode ?? 500),
      );
    }
  }
}
