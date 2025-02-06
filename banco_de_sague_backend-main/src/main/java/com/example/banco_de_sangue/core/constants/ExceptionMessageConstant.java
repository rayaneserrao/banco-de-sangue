package com.example.banco_de_sangue.core.constants;

public final class ExceptionMessageConstant {

    public static final String fileError = "Erro ao carregar o arquivo!";

    public static final String attributeUsed(String attribute) {
        return attribute + " já em uso!";
    }

    public static final String notFound(String name) {
        return name + " não encontrado!";
    }
}
