abstract class LocalStorageRepository {
  Future<String> getString({required String key});

  Future<bool> setString({required String key, required String value});

  Future<bool> removeValue({required String key});
}
