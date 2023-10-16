import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _columnsCount = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'grid_on',
            onPressed: () {
              if (_columnsCount < 3) {
                setState(() {
                  _columnsCount++;
                });
              }
            },
            child: Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'grid_off',
            onPressed: () {
              if (_columnsCount > 2) {
                setState(() {
                  _columnsCount--;
                });
              }
            },
            child: Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'arrow_upward',
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInQuint,
              );
            },
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GridView.builder(
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _columnsCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ),
              )),
    );
  }
}
