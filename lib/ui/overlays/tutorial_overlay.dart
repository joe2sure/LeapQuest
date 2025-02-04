import 'package:flutter/material.dart';
import 'package:leap_quest/config/colors.dart';

class TutorialOverlay extends StatelessWidget {
  final VoidCallback onClose;

  const TutorialOverlay({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: GameColors.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'How to Play',
                style: TextStyle(
                  color: GameColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '1. Tap to jump\n'
                '2. Land on platforms\n'
                '3. Collect power-ups\n'
                '4. Avoid falling',
                style: TextStyle(
                  color: GameColors.textSecondary,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onClose,
                child: Text('Got it!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}