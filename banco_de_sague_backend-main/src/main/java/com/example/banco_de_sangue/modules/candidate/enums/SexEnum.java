package com.example.banco_de_sangue.modules.candidate.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum SexEnum {
    Feminino("Feminino"),
    Masculino("Masculino");

    private String sex;
}
