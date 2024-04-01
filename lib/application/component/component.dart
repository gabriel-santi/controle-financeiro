class Component {
  late final Function() updateScreen;
  bool isLoading = false;
  bool error = false;

  void setError() {
    error = true;
    updateScreen();
  }

  void clearError() {
    error = false;
    updateScreen();
  }

  void setLoading() {
    isLoading = true;
    updateScreen();
  }

  void clearLoading() {
    isLoading = false;
    updateScreen();
  }

  void execute(Function() callback) async {
    setLoading();
    try {
      await callback();
      clearError();
    } catch (e) {
      setError();
      rethrow;
    } finally {
      clearLoading();
    }
  }
}
