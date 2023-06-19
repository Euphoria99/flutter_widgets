import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  List<int> selectedIndexes = [];

  // const CustomGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 120,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: GestureDetector(
            onTap: () {
              setState(
                () {
                  if (selectedIndexes.contains(index)) {
                    selectedIndexes.remove(index);
                  } else {
                    selectedIndexes.add(index);
                  }
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedIndexes.contains(index)
                    ? Colors.green[400]
                    : Colors.white.withOpacity(1),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Stack(
                  children: [
                    // 1st text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: Wrap(
                              children: [
                                Text(
                                  'Shashwatha Pooje',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: selectedIndexes.contains(index)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 2nd text
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 6),
                            child: Text(
                              '₹1000',
                              style: TextStyle(
                                fontSize: 26,
                                color: selectedIndexes.contains(index)
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Image aligned to bottom right)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Image.asset('assets/final.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
