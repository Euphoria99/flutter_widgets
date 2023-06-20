import 'package:flutter/material.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/sliding_panel_widget.dart';

class SlidingPanelScreen extends StatefulWidget {
  const SlidingPanelScreen({super.key});

  @override
  State<SlidingPanelScreen> createState() => _SlidingPanelScreenState();
}

class _SlidingPanelScreenState extends State<SlidingPanelScreen> {
  final panelController = PanelController();
  bool isPanelHidden = false;

  @override
  void initState() {
    super.initState();
    // panelController.hide();
  }

  @override
  Widget build(BuildContext context) {
    //whole height multiply by 60%
    final panelHeightOpened = MediaQuery.of(context).size.height * 0.6;
    //whole height multiply by 10%
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.1;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SlidingUpPanel(
        //
        controller: panelController,
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpened,
        parallaxEnabled: true,
        parallaxOffset: .5,
        defaultPanelState: PanelState.OPEN,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("The contents of body will be here"),
              ElevatedButton(
                  child: const Text('Open Button'),
                  onPressed: () {
                    if (isPanelHidden) {
                      panelController.show(); // Show the panel
                    } else {
                      panelController.hide(); // Hide the panel
                    }
                    isPanelHidden = !isPanelHidden; // Toggle the flag
                  }),
            ],
          ),
        ),
        panelBuilder: (controller) => PannelWidget(
          controller: controller,
          panelController: panelController,
        ),
      ),
    );
  }
}

// if you want any other widget such as FAB to above pannel and move up and down based on panel, you can wrap SlidingUpPanel with stack. 