// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:banco_de_sangue/src/domain/dtos/candidate_age_blood_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_by_state_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_imc_by_age_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_possible_donor_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_sex_obsessed_dto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:banco_de_sangue/src/domain/dtos/candidate_detail_dto.dart';
import 'package:banco_de_sangue/src/domain/repositories/candidato_repository.dart';

class CandidatoViewModel extends ChangeNotifier {
  final CandidatoRepository candidatoRepository;
  CandidatoViewModel({
    required this.candidatoRepository,
  });

  final isLoading = ValueNotifier<bool>(false);

  final list = ValueNotifier<List<CandidateDetailDto>>([]);

  final filter = ValueNotifier<List<CandidateDetailDto>>([]);

  final imcByAge = ValueNotifier<List<CandidateImcByAgeDto>>([]);

  final byState = ValueNotifier<List<CandidateByStateDto>>([]);

  final obeseBySex = ValueNotifier<List<CandidateSexObsessedDto>>([]);

  final averageAgeBlood = ValueNotifier<List<CandidateAgeBloodDto>>([]);

  final possibleDonors = ValueNotifier<List<CandidatePossibleDonorDto>>([]);

  listAll() async {
    isLoading.value = true;
    final result = await candidatoRepository.listPossiblesCandidates();
    result.fold(
      (success) {
        list.value = success;
        filter.value = list.value;
      },
      (failure) => null,
    );
    isLoading.value = false;
  }

  filterList(String value) {
    if (value.isNotEmpty) {
      filter.value = list.value
          .where((element) =>
              element.nome.toLowerCase().contains(value.toLowerCase()) ||
              element.cpf.toLowerCase().contains(value.toLowerCase()) ||
              element.tipoSanguineo
                  .toLowerCase()
                  .contains(value.toLowerCase()) ||
              element.cidade.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filter.value = list.value;
    }
  }

  postAll() async {
    isLoading.value = true;
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    final file = resultFile?.files.single;
    final path = file?.path;
    if (path != null) {
      File arquivo = File(path);
      final result = await candidatoRepository.registerCandidates(arquivo);
      result.fold(
        (success) => null,
        (failure) => debugPrint(failure.toString()),
      );
    }
    isLoading.value = false;
  }

  getImcByAgeRange() async {
    isLoading.value = true;
    final result = await candidatoRepository.averageImcByAgeRange();
    result.fold(
      (success) {
        imcByAge.value = success;
      },
      (failure) => null,
    );
    isLoading.value = false;
  }

  countCandidatesByState() async {
    isLoading.value = true;
    final result = await candidatoRepository.countCandidatesByState();
    result.fold(
      (success) {
        byState.value = success;
      },
      (failure) => debugPrint(failure.toString()),
    );
    isLoading.value = false;
  }

  countCandidatesObeseBySex() async {
    isLoading.value = true;
    final result = await candidatoRepository.countObeseBySex();
    result.fold(
      (success) {
        obeseBySex.value = success;
      },
      (failure) => debugPrint(failure.toString()),
    );
    isLoading.value = false;
  }

  averageAgeByBloodType() async {
    isLoading.value = true;
    final result = await candidatoRepository.averageAgeByBloodType();
    result.fold(
      (success) {
        averageAgeBlood.value = success;
      },
      (failure) => debugPrint(failure.toString()),
    );
    isLoading.value = false;
  }

  countPossibleDonors() async {
    isLoading.value = true;
    final result = await candidatoRepository.countPossibleDonors();
    result.fold(
      (success) {
        possibleDonors.value = success;
      },
      (failure) => debugPrint(failure.toString()),
    );
    isLoading.value = false;
  }
}
