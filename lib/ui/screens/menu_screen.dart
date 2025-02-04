import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';
import 'package:leap_quest/config/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  final List<Widget> _fallingBlocks = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _colorAnimation = ColorTween(
      begin: GameColors.primary,
      end: GameColors.accent,
    ).animate(_controller);

    // Add falling blocks
    for (int i = 0; i < 10; i++) {
      _fallingBlocks.add(
        FallingBlock(
          delay: i * 0.5,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorAnimation.value,
      body: Stack(
        children: [
          ..._fallingBlocks,
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  GameConstants.gameTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                _buildMenuButton(
                  GameConstants.playButtonText,
                  onPressed: () => Navigator.pushNamed(context, '/game'),
                ),
                SizedBox(height: 20),
                _buildMenuButton(
                  GameConstants.settingsButtonText,
                  onPressed: () => Navigator.pushNamed(context, '/settings'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String text, {required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FallingBlock extends StatefulWidget {
  final double delay;

  const FallingBlock({super.key, required this.delay});

  @override
  _FallingBlockState createState() => _FallingBlockState();
}

class _FallingBlockState extends State<FallingBlock> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..forward();

    _animation = Tween<Offset>(
      begin: Offset(Random().nextDouble() * 2 - 1, -1),
      end: Offset(Random().nextDouble() * 2 - 1, 1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        width: 30,
        height: 30,
        color: Colors.white,
      ),
    );
  }
}