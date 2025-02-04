import 'package:flutter/material.dart';
import 'package:leap_quest/config/config.dart';
import 'package:leap_quest/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:leap_quest/config/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: GameColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Play',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Tap the screen to make the ball jump.\n'
              '2. Land on platforms to score points.\n'
              '3. Avoid falling off the screen.\n'
              '4. Collect power-ups for special abilities.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Difficulty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            DropdownButton<String>(
              value: 'Normal',
              dropdownColor: Colors.white,
              items: GameConfig.difficultySettings.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, selectionColor: Colors.white,),
                );
              }).toList(),
              onChanged: (value) {
                // Update difficulty
              },
            ),
            SizedBox(height: 16),
            Text(
              'Audio Settings',
              style: TextStyle(
                color: GameColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            _buildVolumeSlider(settingsProvider),
            SizedBox(height: 16),
            _buildMuteSwitch(settingsProvider),
            Spacer(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildVolumeSlider(SettingsProvider settingsProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Volume',
          style: TextStyle(
            color: GameColors.textPrimary,
            fontSize: 16,
          ),
        ),
        Slider(
          value: settingsProvider.volume,
          onChanged: (value) {
            settingsProvider.setVolume(value);
          },
          activeColor: GameColors.accent,
          inactiveColor: GameColors.buttonSecondary,
        ),
      ],
    );
  }

  Widget _buildMuteSwitch(SettingsProvider settingsProvider) {
    return Row(
      children: [
        Text(
          'Mute',
          style: TextStyle(
            color: GameColors.textPrimary,
            fontSize: 16,
          ),
        ),
        Spacer(),
        Switch(
          value: settingsProvider.isMuted,
          onChanged: (value) {
            settingsProvider.toggleMute();
          },
          activeColor: GameColors.accent,
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: GameColors.buttonPrimary,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        ),
        child: Text(
          'BACK',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}