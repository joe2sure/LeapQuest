import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'PAUSED',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<GameProvider>().resumeGame(),
              child: Text('RESUME'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/menu'),
              child: Text('QUIT'),
            ),
          ],
        ),
      ),
    );
  }
}