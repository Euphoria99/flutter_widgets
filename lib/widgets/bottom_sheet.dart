import 'package:flutter/material.dart';

void showCustomModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (BuildContext context) {
      return const SizedBox(
        height: 400,
        child: Stack(
          children: [
            // Center(
            //   child: ElevatedButton(
            //     child: const Text('Close'),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
            // Positioned(
            //   top: 10,
            //   right: 10,
            //   child: IconButton(
            //     icon: Icon(Icons.close),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
          ],
        ),
      );
    },
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}
