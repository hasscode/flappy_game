import 'package:shared_preferences/shared_preferences.dart';

class ScoreManager {
  static const _key = 'best_score';

  static Future<void> saveBestScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    final best = prefs.getInt(_key) ?? 0;
    if (score > best) {
      await prefs.setInt(_key, score);
    }
  }

  static Future<int> getBestScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }
}

ScoreManager scoreManager =ScoreManager();