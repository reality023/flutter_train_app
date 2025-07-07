class Station {
  final String name;
  final String code;

  const Station({
    required this.name,
    required this.code,
  });

  static List<Station> get stations => [
        const Station(name: '수서', code: 'SSR'),
        const Station(name: '동탄', code: 'DTN'),
        const Station(name: '평택지제', code: 'PTJ'),
        const Station(name: '천안아산', code: 'CAN'),
        const Station(name: '오송', code: 'OSG'),
        const Station(name: '대전', code: 'DJN'),
        const Station(name: '김천구미', code: 'KCG'),
        const Station(name: '동대구', code: 'DDG'),
        const Station(name: '경주', code: 'KJU'),
        const Station(name: '울산', code: 'USN'),
        const Station(name: '부산', code: 'BSN'),
      ];
}
