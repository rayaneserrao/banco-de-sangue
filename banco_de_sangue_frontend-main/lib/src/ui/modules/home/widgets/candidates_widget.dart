import 'package:banco_de_sangue/src/constants/icon_constant.dart';
import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/uikit.dart';

class CandidatesWidget extends StatelessWidget {
  CandidatesWidget({super.key});

  final controller = Injector.get<CandidatoController>();

  @override
  Widget build(BuildContext context) {
    controller.listCandidates();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: SizeToken.lg,
          ),
          InputSearch(
              onChanged: controller.filterCandidates,
              hintText: "Pesquisar...",
              icon: IconConstant.search),
          const SizedBox(
            height: SizeToken.xxs,
          ),
          ValueListenableBuilder(
            valueListenable: controller.candidates,
            builder: (context, value, child) {
              return Align(
                  alignment: Alignment.centerRight,
                  child: TextBodyB2SemiDark(
                      text: "${value.length} encontrados"));
            },
          ),
          const SizedBox(
            height: SizeToken.sm,
          ),
          ValueListenableBuilder(
              valueListenable: controller.candidates,
              builder: (context, value, child) {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (value.isEmpty) {
                  return const Center(
                    child: TextBodyB1SemiDark(text: "Dados não encontrados"),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: SizeToken.sm, vertical: 0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final candidate = value[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: TextLabelL3Dark(text: candidate!.nome),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: SizeToken.xxs),
                        child: TextBodyB2SemiDark(
                            text:
                                "Tipo: ${candidate.tipoSanguineo} | ${candidate.cidade}/${candidate.estado} | ${candidate.celular}"),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: ColorToken.semiDark,
                    thickness: 0.1,
                  ),
                  itemCount: controller.candidates.value.length,
                );
              }),
          const SizedBox(
            height: SizeToken.xl3,
          ),
        ],
      ),
    );
  }
}
