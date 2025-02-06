package com.example.banco_de_sangue.modules.candidate.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.example.banco_de_sangue.modules.candidate.enums.SexEnum;
import com.example.banco_de_sangue.modules.candidate.models.CandidateModel;

@CrossOrigin(origins = "*")
public interface CandidateRepository extends JpaRepository<CandidateModel, String> {
        @Query("SELECT c FROM CandidateModel c WHERE (YEAR(CURRENT_DATE) - YEAR(c.data_nasc)) BETWEEN 16 AND 69")
        List<CandidateModel> listAvailableDonors();

        @Query("SELECT c.estado, COUNT(c) FROM CandidateModel c GROUP BY c.estado")
        List<Object[]> countCandidatesByState();

        @Query("SELECT " +
                        "  CONCAT( FLOOR((YEAR(CURRENT_DATE) - YEAR(c.data_nasc)) / 10) * 10, '-' , FLOOR((YEAR(CURRENT_DATE) - YEAR(c.data_nasc)) / 10) * 10 + 9) AS ageRange, "
                        +
                        "  ROUND(AVG(c.peso / (c.altura * c.altura)), 2) AS averageImc " +
                        "FROM CandidateModel c " +
                        "GROUP BY CONCAT( FLOOR((YEAR(CURRENT_DATE) - YEAR(c.data_nasc)) / 10) * 10, '-' , FLOOR((YEAR(CURRENT_DATE) - YEAR(c.data_nasc)) / 10) * 10 + 9) "
                        +
                        "ORDER BY ageRange")
        List<Object[]> averageImcByAgeRange();

        @Query("SELECT " +
                        "  ROUND(SUM(CASE WHEN c.sexo = :sexEnum AND c.peso / (c.altura * c.altura) >= 30 THEN 1 ELSE 0 END) * 100.0 / "
                        +
                        "  COUNT(CASE WHEN c.sexo = :sexEnum THEN 1 ELSE null END), 2) " + // Arredonda para 2 casas
                                                                                           // decimais
                        "FROM CandidateModel c WHERE c.sexo = :sexEnum")
        Double calculateObesityPercentageBySex(SexEnum sexEnum);

        @Query("SELECT c.tipo_sanguineo, ROUND(AVG(YEAR(CURRENT_DATE) - YEAR(c.data_nasc)), 2) " +
                        "FROM CandidateModel c GROUP BY c.tipo_sanguineo")
        List<Object[]> averageAgeByBloodType();

        @Query(value = """
                            SELECT d.tipo_sanguineo, COUNT(*)
                            FROM candidato d
                            WHERE EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM d.data_nasc) BETWEEN 16 AND 69
                            AND d.peso > 50
                            GROUP BY d.tipo_sanguineo
                            ORDER BY d.tipo_sanguineo
                        """, nativeQuery = true)
        List<Object[]> countPossibleDonors();

}
