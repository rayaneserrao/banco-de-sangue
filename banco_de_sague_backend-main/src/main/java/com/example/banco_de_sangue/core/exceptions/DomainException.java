package com.example.banco_de_sangue.core.exceptions;

public class DomainException extends RuntimeException{
    public DomainException(String message){
        super(message);
    }
}
