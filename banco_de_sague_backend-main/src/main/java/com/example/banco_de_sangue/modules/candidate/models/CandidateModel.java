package com.example.banco_de_sangue.modules.candidate.models;

import java.time.LocalDate;

import com.example.banco_de_sangue.core.serial.DateDeserializerSerial;
import com.example.banco_de_sangue.modules.candidate.enums.SexEnum;
import com.example.banco_de_sangue.modules.candidate.enums.StateEnum;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Table(name = "candidato")
@Entity
@Getter
@Setter
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class CandidateModel {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @EqualsAndHashCode.Include
    @Column(name = "id_candidato")
    private String id;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "cpf", nullable = false)
    private String cpf;

    @Column(name = "rg", nullable = false)
    private String rg;

    @JsonDeserialize(using = DateDeserializerSerial.class)
    @Column(name = "data_nasc", nullable = false)
    private LocalDate data_nasc;

    @Enumerated(EnumType.STRING)
    @Column(name = "sexo", nullable = false)
    private SexEnum sexo;

    @Column(name = "mae", nullable = false)
    private String mae;

    @Column(name = "pai", nullable = false)
    private String pai;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "cep", nullable = false)
    private String cep;

    @Column(name = "endereco", nullable = false)
    private String endereco;

    @Column(name = "numero", nullable = false)
    private Integer numero;

    @Column(name = "bairro", nullable = false)
    private String bairro;

    @Column(name = "cidade", nullable = false)
    private String cidade;

    @Column(name = "estado", nullable = false)
    @Enumerated(EnumType.STRING)
    private StateEnum estado;

    @Column(name = "telefone_fixo", nullable = false)
    private String telefone_fixo;

    @Column(name = "celular", nullable = false)
    private String celular;

    @Column(name = "altura", nullable = false)
    private Double altura;

    @Column(name = "peso", nullable = false)
    private Double peso;

    @Column(name = "tipo_sanguineo", nullable = false)
    private String tipo_sanguineo;
}
