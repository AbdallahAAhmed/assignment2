import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Portrait
  Widget _buildPortraitOrientation() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
    );
  }

  // Landscape
  Widget _buildLandscapeOrientation(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            children: List.generate(
              5,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '${index + 1} Element',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _drawerWidget() {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                5,
                (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    '${index + 1} Element',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Second Assignment'),
            backgroundColor: Colors.deepPurple,
          ),
          drawer: orientation == Orientation.portrait ? _drawerWidget() : null,
          body: orientation == Orientation.portrait
              ? _buildPortraitOrientation()
              : _buildLandscapeOrientation(context),
        );
      },
    );
  }
}
