// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:banco_de_sangue/src/domain/dtos/candidate_age_blood_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_by_state_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_imc_by_age_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_possible_donor_dto.dart';
import 'package:banco_de_sangue/src/domain/dtos/candidate_sex_obsessed_dto.dart';
import 'package:flutter/material.dart';

import 'package:banco_de_sangue/src/domain/dtos/candidate_detail_dto.dart';
import 'package:banco_de_sangue/src/ui/viewmodels/candidato/candidato_view_model.dart';

class CandidatoController extends ChangeNotifier {
  final CandidatoViewModel candidatoViewModel;
  CandidatoController({
    required this.candidatoViewModel,
  });

  ValueNotifier<bool> get isLoading => candidatoViewModel.isLoading;

  ValueNotifier<List<CandidateDetailDto?>> get candidates =>
      candidatoViewModel.filter;

  ValueNotifier<List<CandidateByStateDto?>> get candidatesByState =>
      candidatoViewModel.byState;

  ValueNotifier<List<CandidateImcByAgeDto?>> get candidatesImcByAge =>
      candidatoViewModel.imcByAge;

  ValueNotifier<List<CandidateSexObsessedDto?>> get candidatesSobeseBySex =>
      candidatoViewModel.obeseBySex;

  ValueNotifier<List<CandidateAgeBloodDto?>> get candidatesAverageAgeBlood =>
      candidatoViewModel.averageAgeBlood;

  ValueNotifier<List<CandidatePossibleDonorDto?>> get candidatespossibleDonors =>
      candidatoViewModel.possibleDonors;

  listCandidates() async {
    await candidatoViewModel.listAll();
    notifyListeners();
  }

  registerCandidatos() async {
    await candidatoViewModel.postAll();
    candidatescountPossibleDonors();
    listCandidates();
    getImcCandidateByAgeRange();
    countCandidatesByState();
    countCandidatesObeseBySex();
    candidatesAverageAgeByBloodType();
    candidatescountPossibleDonors();
    notifyListeners();
  }

  filterCandidates(String name) {
    candidatoViewModel.filterList(name);
    notifyListeners();
  }

  getImcCandidateByAgeRange() async {
    await candidatoViewModel.getImcByAgeRange();
    notifyListeners();
  }

  countCandidatesByState() async {
    await candidatoViewModel.countCandidatesByState();
    notifyListeners();
  }

  countCandidatesObeseBySex() async {
    await candidatoViewModel.countCandidatesObeseBySex();
    notifyListeners();
  }

  candidatesAverageAgeByBloodType() async {
    await candidatoViewModel.averageAgeByBloodType();
    notifyListeners();
  }

  candidatescountPossibleDonors() async {
    await candidatoViewModel.countPossibleDonors();
    notifyListeners();
  }
}
