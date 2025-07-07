class AppConstants {
  static const String appTitle = '기차 앱';

  // Routes
  static const String homeRoute = '/';
  static const String seatRoute = '/seat';
  static const String stationListRoute = '/station-list';

  // Station Types
  static const String departureType = '출발역';
  static const String arrivalType = '도착역';

  // Dialog Messages
  static const String bookingConfirmTitle = '예매 하시겠습니까?';
  static const String bookingConfirmContent = '좌석: ';
  static const String cancelButton = '취소';
  static const String confirmButton = '확인';

  // Error Messages
  static const String stationSelectionError = '출발역과 도착역을 선택해주세요.';
  static const String sameStationError = '출발역과 도착역이 같을 수 없습니다.';
  static const String noSeatSelectedError = '좌석을 선택해주세요.';
}
