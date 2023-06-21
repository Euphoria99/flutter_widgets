import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/bottom_sheet.dart';

class SevasScreenOld extends StatefulWidget {
  // final VoidCallback? onTapCallbackSeva;
  // this.onTapCallbackSeva
  const SevasScreenOld({
    super.key,
  });

  @override
  State<SevasScreenOld> createState() => _SevasScreenOldState();
}

class _SevasScreenOldState extends State<SevasScreenOld> {
  List<int> selectedIndexes = [];
  Color appBarColor = Colors.white;

  //scroll
  ScrollController _scrollController = ScrollController();

  //FAB
  FloatingActionButtonLocation _floatingActionButtonLocation =
      FloatingActionButtonLocation.endFloat;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    ///
    _scrollController.addListener(() {
      setState(() {
        final currentPosition = _scrollController.position.pixels;
        if (currentPosition > 10) {
          appBarColor = Colors.grey.withOpacity(
              0.9); // Change the color when scroll position is greater than 100
        } else {
          appBarColor = Colors
              .white; // Reset the color when scroll position is less than or equal to 100
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final position = _scrollController.position;
    print('Current scroll position: ${position.pixels}');
    // print('Top scroll position: ${position.minScrollExtent}');
    // print('Bottom scroll position: ${position.maxScrollExtent}');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widget = List.generate(
      8,
      (index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (selectedIndexes.contains(index)) {
                selectedIndexes.remove(index);
              } else {
                selectedIndexes.add(index);
              }
            });
          },
          child: Material(
            elevation: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: selectedIndexes.contains(index)
                    ? Colors.orangeAccent
                    : null,
              ),
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 45,
                            child: ClipOval(
                              child: Image.asset(
                                'assets/user.jpg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'User Name',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'ID: $index',
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 45,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        // child: IconButton(
                        //   onPressed: () {
                        //     print('arrow button clickd $index');
                        //   },
                        //   icon: const Icon(Icons.arrow_forward_ios),
                        // ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          toolbarHeight: 70,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            'Create Sevas',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black, // Set the desired text color
            ),
          ),
          // leading: IconButton(
          //   color: Colors.black,
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       AppRoutes.homePage,
          //       (_) => false,
          //     );
          //   },
          // ),
        ),
        body: NotificationListener(
          //FAB onscroll based on top and bottom
          onNotification: (ScrollNotification scrollInfo) {
            setState(() {
              if (scrollInfo.metrics.pixels > 0.0) {
                // here you change the condition
                _floatingActionButtonLocation =
                    FloatingActionButtonLocation.endTop;
              } else {
                _floatingActionButtonLocation =
                    FloatingActionButtonLocation.endFloat;
              }
            });

            return true;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SafeArea(
              child: Column(
                children: [
                  // Container(
                  //   height: 56, // Adjust the height as needed
                  //   color: Colors.transparent, // Set the desired background color
                  //   child: Row(
                  //     children: [
                  //       IconButton(
                  //         icon: const Icon(Icons.arrow_back),
                  //         color: Colors.black, // Set the desired icon color
                  //         onPressed: () {
                  //           print('test');
                  //         },
                  //       ),
                  //       const SizedBox(
                  //           width: 8), // Add desired spacing between icon and title
                  //       const Text(
                  //         'New Page',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.black, // Set the desired text color
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ..._widget,
                  const SizedBox(height: 20),
                  // const Text(
                  //   'Example Text Widget',
                  //   style: TextStyle(fontSize: 24),
                  // ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: _floatingActionButtonLocation,
        floatingActionButton: SizedBox(
          height: 75.0,
          width: 75.0,
          child: FloatingActionButton(
            onPressed: () {
              // Handle submit button click
              if (selectedIndexes.length > 0) {
                showCustomModalBottomSheet(context);
              }
            },
            child: Icon(
              Icons.task_alt_rounded,
              size: 30,
            ),
            tooltip: 'Submit',
          ),
        )
        // bottomNavigationBar: BottomAppBar(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Container(
        //       width: double.infinity,
        //       height: kBottomNavigationBarHeight,
        //       margin: const EdgeInsets.symmetric(horizontal: 16.0),
        //       child: ElevatedButton(
        //         style: ButtonStyle(
        //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //             RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(50.0),
        //             ),
        //           ),
        //         ),
        //         onPressed: () {
        //           // Handle submit button click
        //           if (selectedIndexes.length > 0) {
        //             showCustomModalBottomSheet(context);
        //             print('works');
        //           }
        //         },
        //         child: const Text(
        //           'Submit',
        //           style: TextStyle(
        //             fontSize: 20,
        //             // color: Colors.black, // Set the desired text color
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
