import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:graphic/graphic.dart';
import 'package:uikit/uikit.dart';

class CandidateImcByAgeStatistic extends StatelessWidget {
  CandidateImcByAgeStatistic({super.key});

  final candidateController = Injector.get<CandidatoController>();
  @override
  Widget build(BuildContext context) {
     candidateController.getImcCandidateByAgeRange();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeToken.xxl,
        ),
        const TextHeadlineH2(text: "IMC médio a cada 10 anos:"),
        const SizedBox(
          height: SizeToken.xl,
        ),
        ValueListenableBuilder(
          valueListenable: candidateController.candidatesImcByAge,
          builder: (context, value, child) {
            if (candidateController.isLoading.value) {
              return const CircularProgressIndicator();
            }
            if (value.isEmpty) {
              return const Center(
                child: TextBodyB1SemiDark(text: "Dados não encontrados"),
              );
            }
            return SizedBox(
              width: double.infinity,
              height: 300,
              child: Chart(
                data: candidateController.candidatesImcByAge.value
                    .map((e) => {
                          "imc_medio": e!.imcMedio,
                          "faixa_etaria": e.faixaEtaria,
                        })
                    .toList(),
                variables: {
                  'IMC Médio': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['imc_medio'] as num,
                  ),
                  'Faixa Etária': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['faixa_etaria'] as String,
                  ),
                },
                marks: [
                  IntervalMark(
                    position: Varset('Faixa Etária') * Varset('IMC Médio'),
                    color: ColorEncode(value: ColorToken.danger),
                  ),
                ],
                axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
                selections: {'tap': PointSelection(dim: Dim.x)},
                tooltip: TooltipGuide(),
              ),
            );
          },
        ),
      ],
    );
  }
}
