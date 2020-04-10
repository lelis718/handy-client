class DeviceInfo {
  String uuid;
  bool hasLoggedIn;

  DeviceInfo({
    String uuid,
    bool hasLoggedIn,
  }) {
    this.uuid = uuid;
    this.hasLoggedIn = hasLoggedIn;
  }
}
