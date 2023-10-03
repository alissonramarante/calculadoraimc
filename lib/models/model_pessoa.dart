class ModelPessoa {
  final String _nome;
  final double _altura;
  final double _peso;

  ModelPessoa({
    required String nome,
    required double altura,
    required double peso,
  })  : _nome = nome,
        _peso = peso,
        _altura = altura;

  void setNome(String nome) {
    nome = nome;
  }

  void setAltura(double altura) {
    altura = altura;
  }

  void setPeso(double peso) {
    peso = peso;
  }

  String getNome() {
    return _nome;
  }

  double getAltura() {
    return _altura;
  }

  double getPeso() {
    return _peso;
  }

  String imcPessoa(double value) {
    if (value < 16) {
      return "Magreza Grave";
    } else if (value >= 16 && value < 17) {
      return "Magreza moderada";
    } else if (value >= 17 && value < 18.5) {
      return "Magreza leve";
    } else if (value >= 18.5 && value < 25) {
      return "Saudável";
    } else if (value >= 18.5 && value < 30) {
      return "Sobrepeso";
    } else if (value >= 30 && value < 35) {
      return "Obesidade Grau I";
    } else if (value >= 35 && value < 40) {
      return "Obesidade Grau II (severa)";
    } else {
      return "Obesidade Grau III (mórbida)";
    }    
  }

  @override
  String toString() {
    return {"Nome: ": getNome(), "Altura: ": getAltura(), "Peso: ": getPeso()}
        .toString();
  }
}