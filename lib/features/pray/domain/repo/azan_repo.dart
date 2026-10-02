abstract class AzanRepo {
  Future<void> scheduleAdhan({
    required int id,
    required DateTime prayerTimeLocal,
    required String title,
    required String body,
    required bool playSound,
  });

  Future<void> scheduleTodayAdhan();
}
