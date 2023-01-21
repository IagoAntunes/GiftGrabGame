import 'package:flutter/material.dart';

import '../constants/globals.dart';
import 'game_play.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals.isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${Globals.backgroundSprite}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  'Gift Grab',
                  style: TextStyle(
                    fontSize: Globals.isTablet ? 100 : 50,
                  ),
                ),
              ),
              SizedBox(
                width: Globals.isTablet ? 400 : 200,
                height: Globals.isTablet ? 100 : 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const GamePlay(),
                      ),
                    );
                  },
                  child: Text(
                    'Play',
                    style: TextStyle(
                      fontSize: Globals.isTablet ? 50 : 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
