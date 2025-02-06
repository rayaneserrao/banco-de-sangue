import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:graphic/graphic.dart';
import 'package:uikit/uikit.dart';

class CandidateAgeBloodStatistic extends StatelessWidget {
  CandidateAgeBloodStatistic({super.key});

  final candidateController = Injector.get<CandidatoController>();
  @override
  Widget build(BuildContext context) {
    candidateController.candidatesAverageAgeByBloodType();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeToken.xl,
        ),
        const TextHeadlineH2(text: "Média de idade por tipo sanguíneo:"),
        const SizedBox(
          height: SizeToken.xl,
        ),
        ValueListenableBuilder(
          valueListenable: candidateController.candidatesByState,
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
                data: candidateController.candidatesAverageAgeBlood.value
                    .map((e) => {
                          "tipo_sanguineo": e!.tipoSanguineo,
                          "idade_media": e.idadeMedia,
                        })
                    .toList(),
                variables: {
                  'Tipo Sanguíneo': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['tipo_sanguineo'] as String,
                  ),
                  'Idade Média': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['idade_media'] as num,
                  ),
                },
                marks: [
                  IntervalMark(
                    position: Varset('Tipo Sanguíneo') * Varset('Idade Média'),
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
