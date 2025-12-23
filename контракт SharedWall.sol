// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SharedWall {
    string[] public messages;

    event NewMessage(address indexed writer, string message);

    // Функция для записи сообщения
    function writeMessage(string memory _message) public {
        messages.push(_message);

        emit NewMessage(msg.sender, _message);
    }
    // узнаю общее количество сообщений
    function getMessagesCount() public view returns (uint256) {
        return messages.length;
    }
}
