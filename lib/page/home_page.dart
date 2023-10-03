import 'package:calculadoraimc/models/calcula_imc.dart';
import 'package:calculadoraimc/models/model_pessoa.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final nomeEC = TextEditingController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  @override
  void dispose() {
    nomeEC.dispose();
    pesoEC.dispose();
    alturaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: nomeEC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Nome",
                    ),
                    validator: Validatorless.required("Informe o Nome"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: pesoEC,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: "Peso",
                    ),
                    validator: Validatorless.required("Informe o peso em Kg"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: alturaEC,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        labelText: "Altura"),
                    keyboardType: TextInputType.number,
                    validator:
                        Validatorless.required("Informe altura em metros"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final formValid =
                            formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          var pessoa = ModelPessoa(
                            nome: nomeEC.text,
                            altura: double.parse(alturaEC.text),
                            peso: double.parse(pesoEC.text),
                          );

                          double imc = CalculaImc.calcImc(
                              pessoa.getPeso(), pessoa.getAltura());
                          showDialog(
                              context: context,
                              builder: (BuildContext bc) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          "Olá ${pessoa.getNome()}, seu IMC é ${imc.toStringAsFixed(2)}"),
                                      Text("${pessoa.imcPessoa(imc)}")
                                    ],
                                  ),
                                );
                              });
                        }
                        alturaEC.clear();
                        pesoEC.clear();
                        nomeEC.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "Calcular IMC",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
