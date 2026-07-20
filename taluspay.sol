// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TalusPay {
    event PaymentSent(address indexed sender, address indexed receiver, uint256 amount);

    // Hàm nhận và chuyển tiền ngay lập tức
    function pay(address payable _receiver) external payable {
        require(msg.value > 0, "So tien phai lon hon 0");
        require(_receiver != address(0), "Dia chi khong hop le");

        (bool success, ) = _receiver.call{value: msg.value}("");
        require(success, "Giao dich that bai");

        emit PaymentSent(msg.sender, _receiver, msg.value);
    }
}
