// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Calculator {
    // int256 позволяет хранить и положительные, и отрицательные числа,спасибо нейросети я фигачил Uint
    int256 public currentResult;
    address public owner;

    event Operation(address indexed user, string operationType, int256 value, int256 result);
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _; // Символ _; означает "продолжить выполнение кода основной функции"
    }

    // Функция сложения
    function add(int256 value) public {
        currentResult = currentResult + value;
        emit Operation(msg.sender, "ADD", value, currentResult);
    }

    // Функция вычитания
    function subtract(int256 value) public {
        currentResult = currentResult - value;
        emit Operation(msg.sender, "SUBTRACT", value, currentResult);
    }

    // Функция умножения
    function multiply(int256 value) public {
        currentResult = currentResult * value;
        emit Operation(msg.sender, "MULTIPLY", value, currentResult);
    }

    // Функция деления
    function divide(int256 value) public {
        // Проверка: на ноль делить низяяя!
        require(value != 0, "Error: Division by zero is not allowed");
        currentResult = currentResult / value;
        emit Operation(msg.sender, "DIVIDE", value, currentResult);
    }

    // Сброс результата.
    function reset() public onlyOwner {
        currentResult = 0;
    }
} 
