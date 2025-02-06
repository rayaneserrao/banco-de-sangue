import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/uikit.dart';

class CandidateByStateStatistic extends StatelessWidget {
  CandidateByStateStatistic({super.key});

  final candidateController = Injector.get<CandidatoController>();
  @override
  Widget build(BuildContext context) {
    candidateController.countCandidatesByState();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: SizeToken.xxl,
      ),
      const TextHeadlineH2(text: "Candidatos por estado:"),
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
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: value.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorToken.dark, width: 1),
                      borderRadius: BorderRadius.circular(SizeToken.xxs),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextLabelL4Dark(
                              text: value[index]!.estado,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: ColorToken.dark,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextBodyB2Dark(
                              text: value[index]!.quantidade.toString(),
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            );
          })
    ]);
  }
}
