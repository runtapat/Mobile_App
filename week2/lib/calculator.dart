import 'package:flutter/material.dart';

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    buildButtonRow(
                      ["C", "+/-", "%", "÷"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["7", "8", "9", "x"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["4", "5", "6", "-"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["1", "2", "3", "+"],
                      isOperator: [false, false, false, true],
                    ),
                    buildButtonRow(
                      ["0", ".", "="],
                      // มี 3 ปุ่ม ต้องมี 3 ค่า
                      isOperator: [false, false, true],
                      isDoubleZero: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(
    List<String> labels, {
    required List<bool> isOperator,
    bool isDoubleZero = false,
  }) {
    return Expanded(
      child: Row(
        children: List.generate(labels.length, (index) {
          final bool isZeroButton = isDoubleZero && index == 0;

          // พื้นหลังทุกปุ่มเป็นเทาเข้ม
          final Color bgColor = Colors.grey[850]!;

          // ถ้าเป็น operator → ฟอนต์ส้ม, ถ้าไม่ใช่ → ฟอนต์ขาว
          final Color textColor = isOperator[index]
              ? Colors.orange
              : Colors.white;

          return Expanded(
            flex: isZeroButton ? 2 : 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: isZeroButton ? null : 120,
                height: 90,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: 28,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
