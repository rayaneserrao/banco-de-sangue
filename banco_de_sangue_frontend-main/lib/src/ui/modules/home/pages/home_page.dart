import 'package:banco_de_sangue/src/constants/icon_constant.dart';
import 'package:banco_de_sangue/src/ui/modules/home/controllers/candidato_controller.dart';
import 'package:banco_de_sangue/src/ui/modules/home/controllers/menu_controller_index.dart';
import 'package:banco_de_sangue/src/ui/modules/home/widgets/candidates_widget.dart';
import 'package:banco_de_sangue/src/ui/modules/home/widgets/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:uikit/atomic/molecules/icon/icon_large_ligth.dart';
import 'package:uikit/uikit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final candidatoController = Injector.get<CandidatoController>();
  final menuController = MenuControllerIndex();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextHeadlineH1(text: 'Banco de Sangue'),
        centerTitle: true,
      ),
      body: ContentDefault(
        child: ValueListenableBuilder(
          valueListenable: menuController.currentIndex,
          builder: (context, value, child) => IndexedStack(
            index: menuController.currentIndex.value,
            children: [
              StatisticsWidget(),
              CandidatesWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: menuController.currentIndex,
        builder: (context, value, child) => ButtonNavigatorMenu(
          currentIndex: menuController.currentIndex.value,
          onTap: menuController.onIndexTapped,
          firstLabel: "Estatísicas",
          secoundLabel: "Candidatos",
          firstIcon: IconConstant.chart,
          secoundIcon: IconConstant.candidates,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 3, left: 3, right: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: ColorToken.light),
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          clipBehavior: Clip.antiAlias,
          backgroundColor: ColorToken.danger,
          onPressed: () => candidatoController.registerCandidatos(),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: ValueListenableBuilder<bool>(
                valueListenable: candidatoController.isLoading,
                builder: (context, isLoading, child) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorToken.light,
                      ),
                    );
                  }
                  return const IconLargeLigth(icon: IconConstant.add);
                },
              )),
        ),
      ),
    );
  }
}
