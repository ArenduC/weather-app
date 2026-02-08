enum WarningType {
   noInternet,
   bluetoothOn,
   isRootedDevice,
   isRecording,
   isSharing,
}

class AppWarning{

  final WarningType type;
  final String message;

  AppWarning({
    required this.type,
    required this.message,

  });

}