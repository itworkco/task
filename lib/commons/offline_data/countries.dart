import 'package:task/commons/models/country.dart';
import 'package:task/commons/paths/flags.dart';

class OfflineData {
  static final List<CountryModel> countries = [
    CountryModel('الإمارات العربية المتحدة', FlagsImagesPaths.uae, 'AE'),
    CountryModel('المملكة العربية السعودية', FlagsImagesPaths.saudi, 'SA'),
    CountryModel('مصر', FlagsImagesPaths.egypt, 'EG'),
    CountryModel('الأردن', FlagsImagesPaths.jordan, 'JO'),
    CountryModel('سوريا', FlagsImagesPaths.syria, 'SY'),
    CountryModel('لبنان', FlagsImagesPaths.lebanon, 'LB'),
    CountryModel('اليمن', FlagsImagesPaths.yemen, 'YE'),
    CountryModel('الجزائر', FlagsImagesPaths.algeria, 'DZ'),
    CountryModel('تونس', FlagsImagesPaths.tunisia, 'TN'),
    CountryModel('المغرب', FlagsImagesPaths.morocco, 'MA'),
    CountryModel('سلطنة عمان', FlagsImagesPaths.oman, 'OM'),
  ];
}
