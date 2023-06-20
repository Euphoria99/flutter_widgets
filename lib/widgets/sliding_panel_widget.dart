import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PannelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  PannelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: controller,
      children: [
        SizedBox(height: 18),
        buildDragHandle(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        buildAboutText(),
      ],
    );
  }

  final List<Widget> textWidgets = List.generate(10, (index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${index + 1}-Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
        ),
        const SizedBox(height: 12),
      ],
    );
  });

  Widget buildAboutText() {
    final int numberOfClones = 20;

    final List<Widget> textWidgets = List.generate(
      numberOfClones,
      (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}- Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
            ),
            SizedBox(height: 12),
          ],
        );
      },
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...textWidgets],
      ),
    );
  }

  //drag handle

  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 60,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[400],
            ),
          ),
        ),
        onTap: togglePanel,
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();
}
