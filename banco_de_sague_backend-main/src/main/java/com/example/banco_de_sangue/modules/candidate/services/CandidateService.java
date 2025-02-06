package com.example.banco_de_sangue.modules.candidate.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.banco_de_sangue.modules.candidate.enums.SexEnum;
import com.example.banco_de_sangue.modules.candidate.enums.StateEnum;
import com.example.banco_de_sangue.modules.candidate.models.CandidateModel;
import com.example.banco_de_sangue.modules.candidate.repositories.CandidateRepository;

import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CandidateService {
    private CandidateRepository candidateRepository;

    @Transactional
    public List<CandidateModel> saveAllCandidates(List<CandidateModel> candidates) {
        return candidateRepository.saveAll(candidates);
    }

    @Transactional
    public List<CandidateModel> listAvailableDonors() {
        return candidateRepository.listAvailableDonors();
    }

    @Transactional
    public List<Map<String, Object>> countCandidatesByState() {
        List<Object[]> result = candidateRepository.countCandidatesByState();
        List<Map<String, Object>> stateCountList = new ArrayList<>();
        for (Object[] row : result) {
            StateEnum state = (StateEnum) row[0];
            Long count = (Long) row[1];
            Map<String, Object> map = new HashMap<>();
            map.put("estado", state);
            map.put("quantidade", count);
            stateCountList.add(map);
        }
        return stateCountList;
    }

    @Transactional
    public List<Map<String, Object>> averageImcByAgeRange() {
        List<Object[]> result = candidateRepository.averageImcByAgeRange();
        List<Map<String, Object>> imcAgeList = new ArrayList<>();

        for (Object[] row : result) {
            String age = (String) row[0];
            Double imc = (Double) row[1];
            Map<String, Object> map = new HashMap<>();
            map.put("faixa_etaria", age);
            map.put("imc_medio", imc);
            imcAgeList.add(map);
        }
        return imcAgeList;
    }

    @Transactional
    public List<Map<String, Object>> countObeseBySex() {
        List<Map<String, Object>> obesityPercentagesList = new ArrayList<>();

        Double maleObesityPercentage = candidateRepository.calculateObesityPercentageBySex(SexEnum.Masculino);
        Map<String, Object> maleObesityMap = new HashMap<>();
        maleObesityMap.put("sexo", SexEnum.Masculino);
        maleObesityMap.put("percentual_obesidade", maleObesityPercentage);
        obesityPercentagesList.add(maleObesityMap);

        Double femaleObesityPercentage = candidateRepository.calculateObesityPercentageBySex(SexEnum.Feminino);
        Map<String, Object> femaleObesityMap = new HashMap<>();
        femaleObesityMap.put("sexo", SexEnum.Feminino);
        femaleObesityMap.put("percentual_obesidade", femaleObesityPercentage);
        obesityPercentagesList.add(femaleObesityMap);

        return obesityPercentagesList;
    }

    @Transactional
    public List<Map<String, Object>> averageAgeByBloodType() {
        List<Object[]> result = candidateRepository.averageAgeByBloodType();
        List<Map<String, Object>> imcAgeList = new ArrayList<>();

        for (Object[] row : result) {
            String bloodType = (String) row[0];
            Double averageAge = (Double) row[1];
            Map<String, Object> map = new HashMap<>();
            map.put("tipo_sanguineo", bloodType);
            map.put("idade_media", averageAge);
            imcAgeList.add(map);
        }
        return imcAgeList;
    }

    @Transactional
    public List<Map<String, Object>> countPossibleDonors() {
        List<Object[]> result = candidateRepository.countPossibleDonors();
        Map<String, Long> countPossibleDonorsMap = new HashMap<>();

        for (Object[] row : result) {
            String bloodType = (String) row[0];
            Long count = (Long) row[1];
            countPossibleDonorsMap.put(bloodType, count);
        }

        Long totalAPlus = countPossibleDonorsMap.getOrDefault("A+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L);

        Long totalAMinus = countPossibleDonorsMap.getOrDefault("A+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L)
                + countPossibleDonorsMap.getOrDefault("A-", 0L)
                + countPossibleDonorsMap.getOrDefault("AB-", 0L);

        Long totalBPlus = countPossibleDonorsMap.getOrDefault("B+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L);

        Long totalBMinus = countPossibleDonorsMap.getOrDefault("B+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L)
                + countPossibleDonorsMap.getOrDefault("B-", 0L)
                + countPossibleDonorsMap.getOrDefault("AB-", 0L);

        Long totalABPlus = countPossibleDonorsMap.getOrDefault("AB+", 0L);

        Long totalABMinus = countPossibleDonorsMap.getOrDefault("AB+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB-", 0L);

        Long totalOPlus = countPossibleDonorsMap.getOrDefault("B+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L)
                + countPossibleDonorsMap.getOrDefault("A+", 0L)
                + countPossibleDonorsMap.getOrDefault("O+", 0L);

        Long totalOMinus = countPossibleDonorsMap.getOrDefault("B+", 0L)
                + countPossibleDonorsMap.getOrDefault("AB+", 0L)
                + countPossibleDonorsMap.getOrDefault("A+", 0L)
                + countPossibleDonorsMap.getOrDefault("O+", 0L)
                + countPossibleDonorsMap.getOrDefault("B-", 0L)
                + countPossibleDonorsMap.getOrDefault("AB-", 0L)
                + countPossibleDonorsMap.getOrDefault("A-", 0L)
                + countPossibleDonorsMap.getOrDefault("O-", 0L);

        List<Map<String, Object>> resultList = new ArrayList<>();

        resultList.add(createResultMap("A+", totalAPlus));
        resultList.add(createResultMap("A-", totalAMinus));
        resultList.add(createResultMap("B+", totalBPlus));
        resultList.add(createResultMap("B-", totalBMinus));
        resultList.add(createResultMap("AB+", totalABPlus));
        resultList.add(createResultMap("AB-", totalABMinus));
        resultList.add(createResultMap("O+", totalOPlus));
        resultList.add(createResultMap("O-", totalOMinus));

        return resultList;
    }

    private Map<String, Object> createResultMap(String bloodType, Long total) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("tipo_sanguineo", bloodType);
        resultMap.put("quantidade", total);
        return resultMap;
    }

}
