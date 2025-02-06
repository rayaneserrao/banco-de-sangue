import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:graphic/graphic.dart';
import 'package:uikit/uikit.dart';

class CandidatePossibleDonorStatistic extends StatelessWidget {
  CandidatePossibleDonorStatistic({super.key});

  final candidateController = Injector.get<CandidatoController>();
  @override
  Widget build(BuildContext context) {
    candidateController.candidatescountPossibleDonors();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: SizeToken.xl,
        ),
        const TextHeadlineH2(
            text: "Possíveis doadores para cada tipo de sangue:"),
        const SizedBox(
          height: SizeToken.xl,
        ),
        ValueListenableBuilder(
          valueListenable: candidateController.candidatespossibleDonors,
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
                data: candidateController.candidatespossibleDonors.value
                    .map((e) => {
                          "tipo_sanguineo": e!.tipoSanguineo,
                          "quantidade": e.quantidade,
                        })
                    .toList(),
                variables: {
                  'Tipo Sanguíneo': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['tipo_sanguineo'] as String,
                  ),
                  'Quantidade': Variable(
                    accessor: (Map<String, Object> map) =>
                        map['quantidade'] as num,
                  ),
                },
                marks: [
                  IntervalMark(
                    position: Varset('Tipo Sanguíneo') * Varset('Quantidade'),
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
