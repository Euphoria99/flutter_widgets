import 'package:flutter/material.dart';

class CustomSliver extends StatelessWidget {
  const CustomSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: CustomScrollView(
          slivers: [
            //sliver app bar
            const SliverAppBar(
              backgroundColor: Colors.deepPurple,
              leading: Icon(Icons.menu),
              // title: Text('H A W A I I'),
              // centerTitle: true,
              expandedHeight: 400,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                    image: NetworkImage(
                        'https://escales.ponant.com/wp-content/uploads/2020/12/plage.jpg.webp'),
                    fit: BoxFit.cover),
                centerTitle: true,
                title: Text(
                  'S L I V E R A P P B A R',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                // background: Container(
                //   color: Colors.pink,
                // ),
              ),
            ),

            //sliver items
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  //                   borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(10.0),
                  //   bottomRight: Radius.circular(10.0),
                  // ),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 20,
                  right: 20,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.deepPurple[400],
                    height: 150,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
