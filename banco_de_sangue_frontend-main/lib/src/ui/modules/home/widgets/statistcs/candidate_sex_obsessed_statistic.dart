import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/uikit.dart';

class CandidateSexObsessedStatistic extends StatelessWidget {
  CandidateSexObsessedStatistic({super.key});

  final candidateController = Injector.get<CandidatoController>();
  @override
  Widget build(BuildContext context) {
    candidateController.countCandidatesObeseBySex();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: SizeToken.xxl,
      ),
      const TextHeadlineH2(text: "Percentual de obsedidade:"),
      const SizedBox(
        height: SizeToken.xl,
      ),
     ValueListenableBuilder<bool>(
  valueListenable: candidateController.isLoading,
  builder: (context, isLoading, child) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ValueListenableBuilder(
      valueListenable: candidateController.candidatesSobeseBySex,
      builder: (context, value, child) {
        if (value.isEmpty) {
          return const Center(child: TextBodyB1SemiDark(text: "Dados não encontrados"));
        }
        
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(value[index]!.sexo),
                          ),
                        ),
                        const Divider(height: 1, thickness: 1, color: Colors.black),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("${value[index]!.percentualObesidade}%"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  index > 0
                      ? const SizedBox.shrink()
                      : const VerticalDivider(color: Colors.black, thickness: 1, width: 1),
                ],
              );
            },
          ),
        );
      },
    );
  },
),
  ]);
  }
}
