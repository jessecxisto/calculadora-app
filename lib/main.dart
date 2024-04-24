import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GestureDetector simbolosRow1(String number, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 160, 160, 160),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: const Color.fromARGB(255, 204, 204, 204),
            onTap: onTap,
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 50,
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildNumberButton(String number, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 37, 38),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            splashColor: const Color.fromARGB(255, 108, 108, 108),
            onTap: onTap,
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontFamily: "Rubik",
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String numero = "0";

  double primeiroNumero = 0.0;

  String operacao = "";

  void calcular(String tecla) {
    switch (tecla) {
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
      case ",":
        setState(
          () {
            numero += tecla;

            numero = numero.replaceAll(",", ".");

            if (!numero.contains(".")) {
              int numeroInt = int.parse(numero);
              numero = numeroInt.toString();
            }
            numero = numero.replaceAll(".", ",");
          },
        );
        break;

      case "+":
        operacao = "+";
        numero = numero.replaceAll(",", ".");
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = "0";
        break;

      case "-":
        operacao = "-";
        numero = numero.replaceAll(",", ".");
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = "0";
        break;

      case "X":
        operacao = "X";
        numero = numero.replaceAll(",", ".");
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = "0";
        break;

      case "/":
        operacao = "/";
        numero = numero.replaceAll(",", ".");
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = "0";
        break;

      case "%":
        operacao = "%";
        numero = numero.replaceAll(",", ".");
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll(".", ",");
        numero = "0";
        break;

      case "=":
        double resultado = 0.0;

        if (operacao == "/") {
          if (double.parse(numero) * 1 == 0) {
            print("ERRO: Divisão por zero");

            return;
          }
        }

        if (operacao == "+") {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operacao == "-") {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operacao == "X") {
          resultado = primeiroNumero * double.parse(numero);
        }
        if (operacao == "/") {
          resultado = primeiroNumero / double.parse(numero);
        }
        if (operacao == "%") {
          resultado = primeiroNumero / 100;
        }

        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split(".");

        if (resultado > 9999999) {
          setState(
            () {
              numero = numero.replaceAll(",", ".");
              numero = "ERRO";
              numero = numero.replaceAll(".", ",");
            },
          );
        } else if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(
            () {
              numero = numero.replaceAll(",", ".");
              numero = int.parse(resultadoPartes[0]).toString();
              numero = numero.replaceAll(".", ",");
            },
          );
        } else {
          setState(() {
            numero = numero.replaceAll(",", ".");
            numero = resultado.toString();
            numero = numero.replaceAll(".", ",");
          });
        }

        break;

      case "AC":
        setState(() {
          numero = "0";
        });
        break;

      case "<X":
        setState(() {
          if (numero.isNotEmpty) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 0,
            left: 40,
            right: 40,
          ),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(operacao),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    numero.length > 7 ? numero.substring(0, 7) : numero,
                    style: const TextStyle(
                      fontSize: 70,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular("<X"),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 160, 160, 160),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 204, 204, 204),
                          onTap: () => calcular("<X"),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_backspace_rounded,
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  simbolosRow1("AC", () => calcular("AC")),
                  simbolosRow1("%", () => calcular("%")),
                  GestureDetector(
                    onTap: () => calcular("/"),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 147, 84, 255),
                          onTap: () => calcular("/"),
                          child: Center(
                            child: Image.asset(
                              "assets/images/simbolo_divisao.png",
                              width: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNumberButton("7", () => calcular("7")),
                  buildNumberButton("8", () => calcular("8")),
                  buildNumberButton("9", () => calcular("9")),
                  GestureDetector(
                    onTap: () => calcular("X"),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 147, 84, 255),
                          onTap: () => calcular("X"),
                          child: Center(
                            child: Image.asset(
                              "assets/images/simbolo_multiplicacao.png",
                              width: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNumberButton("4", () => calcular("4")),
                  buildNumberButton("5", () => calcular("5")),
                  buildNumberButton("6", () => calcular("6")),
                  GestureDetector(
                    onTap: () => calcular("-"),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 147, 84, 255),
                          onTap: () => calcular("-"),
                          child: Center(
                            child: Image.asset(
                              "assets/images/simbolo_subtracao.png",
                              width: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildNumberButton("1", () => calcular("1")),
                  buildNumberButton("2", () => calcular("2")),
                  buildNumberButton("3", () => calcular("3")),
                  GestureDetector(
                    onTap: () => calcular("+"),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 147, 84, 255),
                          onTap: () => calcular("+"),
                          child: Center(
                            child: Image.asset(
                              "assets/images/simbolo_adicao.png",
                              width: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => calcular("0"),
                    child: Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 37, 38),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildNumberButton(",", () => calcular(",")),
                  GestureDetector(
                    onTap: () => calcular("="),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: const Color.fromARGB(255, 147, 84, 255),
                          onTap: () => calcular("="),
                          child: Center(
                            child: Image.asset(
                              "assets/images/simbolo_igual.png",
                              width: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Text("Coluna 6"),
            ],
          ),
        ),
      ),
    );
  }
}
