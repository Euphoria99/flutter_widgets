import 'package:flutter/material.dart';

class CustomSliver extends StatefulWidget {
  CustomSliver({super.key});

  @override
  State<CustomSliver> createState() => _CustomSliverState();
}

class _CustomSliverState extends State<CustomSliver> {
  ScrollController _scrollController = ScrollController();
  bool _showTitle = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 50 && _showTitle) {
      setState(() {
        _showTitle = false;
      });
    } else if (_scrollController.offset <= 0 && !_showTitle) {
      setState(() {
        _showTitle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            //sliver app bar
            SliverAppBar(
              backgroundColor: Colors.deepPurple,
              leading: Icon(Icons.menu),
              title: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: _showTitle ? 1.0 : 0.0,
                child: Text('H A W A I I'),
              ),
              // centerTitle: true,
              expandedHeight: 400,
              pinned: true,
              floating: false,
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage(
                    'https://escales.ponant.com/wp-content/uploads/2020/12/plage.jpg.webp',
                  ),
                  fit: BoxFit.cover,
                ),
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
