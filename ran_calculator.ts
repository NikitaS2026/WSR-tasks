import { ethers } from "hardhat";

async function main() {

    const Calculator = await ethers.getContractFactory("Calculator");
    const calculator = await Calculator.deploy();
    await calculator.deployed();

    console.log("Развернут по адресу:", calculator.address);

    let res = await calculator.currentResult();
    console.log("Первоначальный результат:", res.toString());

    console.log("Добавляю  100");
    let tx = await calculator.add(100);
    await tx.wait(); // Ждем подтверждения
    res = await calculator.currentResult();
    console.log("После добавления:", res.toString());

    console.log("Умножаю на 5");
    tx = await calculator.multiply(5);
    await tx.wait();
    res = await calculator.currentResult();
    console.log("После умножения :", res.toString());

    console.log("Вычитаю 250");
    tx = await calculator.subtract(250);
    await tx.wait();
    res = await calculator.currentResult();
    console.log("После вычитания :", res.toString());

    console.log("Делю на 10");
    tx = await calculator.divide(10);
    await tx.wait();
    res = await calculator.currentResult();
    console.log("Окончательный результат:", res.toString());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
