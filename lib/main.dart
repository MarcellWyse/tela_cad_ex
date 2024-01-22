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
  bool tenhoFilhos = false;
  bool necessidadesEspeciais = false;
  List<bool> opcoesEspeciaisSelecionadas = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 66, 34, 0),
              child: Container(
                width: 325,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[
                      Color(0xFF5E51FF),
                      Color(0xFFFF97A6),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(124.67, 20, 124.67, 0),
              child: Image.asset("assets/logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(47, 16, 47, 0),
              child: Text(
                "Agora por último",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color(0xFF2F2F2F)),
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(17, 5, 17, 0),
              child: Text(
                "Essas informações não serão exibidas no seu\n perfil. Elas são solicitadas apenas para que\n possamos oferecer acomodações adequadas, se\n necessário, durante suas viagens.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF747474),
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(21, 5, 21, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tenho filhos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000068),
                    ),
                  ),
                  Checkbox(
                    shape: const CircleBorder(),
                    value: tenhoFilhos,
                    onChanged: (bool? value) {
                      setState(() {
                        tenhoFilhos = value!;
                      });
                    },
                    activeColor: const Color(0xFF6666A4),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 351,
              child: Divider(
                thickness: 1,
                color: Color(0xFF6666A4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sou portador(a)\n de necessidades especiais",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000068),
                    ),
                  ),
                  Checkbox(
                    shape: const CircleBorder(),
                    value: necessidadesEspeciais,
                    onChanged: (bool? value) {
                      setState(() {
                        necessidadesEspeciais = value!;
                      });
                    },
                    activeColor: const Color(0xFF6666A4),
                  ),
                ],
              ),
            ),

            if (necessidadesEspeciais)
              ...List.generate(
                6,
                (index) => Padding(
                  padding: const EdgeInsets.fromLTRB(21, 0, 21, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getOptionText(index),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF747474),
                            ),
                          ),
                          Checkbox(
                            shape: const CircleBorder(),
                            value: opcoesEspeciaisSelecionadas[index],
                            onChanged: (bool? value) {
                              setState(() {
                                opcoesEspeciaisSelecionadas[index] = value!;
                              });
                              // Adicione a lógica que você deseja executar ao mudar a opção
                            },
                            activeColor: const Color(0xFF6666A4),
                          ),
                        ],
                      ),
                      const Divider(
                          height: 1,
                          color: Color(
                              0xFF6666A4)), // Divider abaixo de cada linha
                    ],
                  ),
                ),
              ),

            Expanded(
              child: Container(),
            ),

            // Botão Continuar alinhado ao final da tela
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 40,
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a lógica que você deseja executar ao pressionar o botão Continuar
                      // Por exemplo, navegação para outra tela
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF5E51FF), // Cor de fundo do botão
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4.0), // Formato do botão
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style:
                          TextStyle(fontSize: 14.0, color: Color(0xFFFBFBFB)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getOptionText(int index) {
    switch (index) {
      case 0:
        return "Deficiência Visual";
      case 1:
        return "Deficiência Auditiva";
      case 2:
        return "Deficiência Física";
      case 3:
        return "Deficiência Intelectual";
      case 4:
        return "Deficiência Cognitiva";
      case 5:
        return "Deficiência Emocional";
      default:
        return "";
    }
  }
}
