import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? swText = '',
  }) =>
      [enText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'muropko6': {
      'en': 'Page Title',
      'sw': 'Kichwa cha Ukurasa',
    },
    'kalrq2fb': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // loginPage
  {
    'shm0fkc2': {
      'en': 'Board Member Login',
      'sw': 'Kuingia kwa Mwanachama wa Bodi',
    },
    '28meovxw': {
      'en':
          'Welcome back. Please enter your credentials to access the secure board portal.',
      'sw':
          'Karibu tena. Tafadhali weka kitambulisho chako ili kufikia lango salama la ubao.',
    },
    '8g5nbwqd': {
      'en': 'Corporate Email',
      'sw': 'Barua pepe ya Kampuni',
    },
    'nsehed1t': {
      'en': 'Password',
      'sw': 'Nenosiri',
    },
    '0x8io7v7': {
      'en': 'Forgot Password?',
      'sw': 'Umesahau Nenosiri?',
    },
    '61sb29y6': {
      'en': 'Login',
      'sw': 'Ingia',
    },
    'jb3dzgph': {
      'en': 'Secure Login',
      'sw': 'Kuingia kwa Usalama',
    },
    'gfecj97m': {
      'en':
          'This portal is protected with enterprise-grade security and biometric authentication.',
      'sw':
          'Tovuti hii inalindwa kwa usalama wa kiwango cha biashara na uthibitishaji wa kibayometriki.',
    },
    'e0j6nxj8': {
      'en': 'Optimized for iPad',
      'sw': 'Imeboreshwa kwa ajili ya iPad',
    },
  },
  // DocumentList
  {
    '1hs2jpkf': {
      'en': 'Sticky Header One',
      'sw': 'Kichwa Kinatacho cha Kwanza',
    },
    'ekl47zkh': {
      'en': 'A',
      'sw': 'A',
    },
    '1f0hf83y': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'l27qi7fb': {
      'en': 'A',
      'sw': 'A',
    },
    'g5024fwy': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'yd9l8u53': {
      'en': 'A',
      'sw': 'A',
    },
    'ghph9elh': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'jp5sqwto': {
      'en': 'A',
      'sw': 'A',
    },
    'lf7k6j4q': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'hs7o2e81': {
      'en': 'A',
      'sw': 'A',
    },
    'gf6iz2nh': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'v3fn6so1': {
      'en': 'Sticky Header Two',
      'sw': 'Kichwa cha Nata cha Pili',
    },
    '91t2i5wu': {
      'en': 'A',
      'sw': 'A',
    },
    '1tqr7wtl': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    '36vq7l2t': {
      'en': 'A',
      'sw': 'A',
    },
    '94h2o1kf': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'thy71a6l': {
      'en': 'A',
      'sw': 'A',
    },
    '76fis7mo': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'gvb7jubk': {
      'en': 'A',
      'sw': 'A',
    },
    'feyqe2jw': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'gyjio9gd': {
      'en': 'A',
      'sw': 'A',
    },
    'nd93m43a': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    '6v4nyh6k': {
      'en': 'Sticky Header Three',
      'sw': 'Kichwa Kinatacho cha Tatu',
    },
    '2qwv8gxy': {
      'en': 'A',
      'sw': 'A',
    },
    '3p7u1ei2': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'ce36pya1': {
      'en': 'A',
      'sw': 'A',
    },
    '5xouok7n': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'wff9rjsm': {
      'en': 'A',
      'sw': 'A',
    },
    'pciv4myg': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'jvixh63c': {
      'en': 'A',
      'sw': 'A',
    },
    'wjw8pby5': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'j1p9wz3n': {
      'en': 'A',
      'sw': 'A',
    },
    'escegzn2': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'ndby8fdo': {
      'en': 'Sticky Header Four',
      'sw': 'Kichwa Kinatacho cha Nne',
    },
    'gr2kyxsz': {
      'en': 'A',
      'sw': 'A',
    },
    '6p8pld4e': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'rjrmo7dv': {
      'en': 'A',
      'sw': 'A',
    },
    'v3w2n5kb': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    '4k9iogei': {
      'en': 'A',
      'sw': 'A',
    },
    'i2ixs5sb': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'rr5zbfan': {
      'en': 'A',
      'sw': 'A',
    },
    'spwibq7k': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'zskyqt2s': {
      'en': 'A',
      'sw': 'A',
    },
    'uhzklpql': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    'bx2aq53w': {
      'en': 'A',
      'sw': 'A',
    },
    'eiuctbht': {
      'en': 'List Item',
      'sw': 'Kipengee cha Orodha',
    },
    's3coklkc': {
      'en': 'My Users',
      'sw': 'Watumiaji Wangu',
    },
    '6n4wmooy': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // eventsupdatesPageSample
  {
    'cv2u446x': {
      'en': 'Event Updates',
      'sw': 'Sasisho za Tukio',
    },
    'uuq53cmy': {
      'en': 'Dodoma, Tanzania',
      'sw': 'Dodoma, Tanzania',
    },
    '5q0q6t3z': {
      'en': '  ',
      'sw': '',
    },
    'u52k7e08': {
      'en': 'Events',
      'sw': 'Matukio',
    },
  },
  // meetingUpdates
  {
    '1yzekkkz': {
      'en': 'Search meetings...',
      'sw': 'Tafuta mikutano...',
    },
  },
  // userProfile
  {
    'dnfwbm71': {
      'en': 'System Settings',
      'sw': 'Mipangilio ya Mfumo',
    },
    '4l5mcoh1': {
      'en': 'Dark Mode',
      'sw': 'Hali ya Giza',
    },
    'ppbiu7ei': {
      'en': 'Language',
      'sw': 'Lugha',
    },
    'swrwbe6l': {
      'en': 'Member In Commetee',
      'sw': 'Mjumbe Katika Kamati',
    },
    'ypmlkppz': {
      'en': 'Commettee',
      'sw': 'Kamati',
    },
    'mqv9rpt0': {
      'en': 'Notification Settings',
      'sw': 'Mipangilio ya Arifa',
    },
    'psw3pq68': {
      'en': 'Manage your notifications',
      'sw': 'Dhibiti arifa zako',
    },
    'usggqejo': {
      'en': 'Privacy & Security',
      'sw': 'Faragha na Usalama',
    },
    'mzinixnv': {
      'en': 'Control your privacy settings',
      'sw': 'Dhibiti mipangilio yako ya faragha',
    },
    'fzmy3w81': {
      'en': 'Sign Out',
      'sw': 'Ondoka',
    },
    '9kb9cjyl': {
      'en': 'Profile',
      'sw': 'Wasifu',
    },
  },
  // meetingCalenderbkp
  {
    'k7fs5c7x': {
      'en': 'Meeting Calendar',
      'sw': 'Kalenda ya Mkutano',
    },
    'liqx1rvl': {
      'en': 'October 2023',
      'sw': 'Oktoba 2023',
    },
    'e9ane2qx': {
      'en': 'S',
      'sw': 'S',
    },
    'muesic93': {
      'en': 'M',
      'sw': 'M',
    },
    'pm0215yj': {
      'en': 'T',
      'sw': 'T',
    },
    't9t9r5gh': {
      'en': 'W',
      'sw': 'W',
    },
    '3hqvdfc8': {
      'en': 'T',
      'sw': 'T',
    },
    '7lrxuu3g': {
      'en': 'F',
      'sw': 'F',
    },
    '9z550qd4': {
      'en': 'S',
      'sw': 'S',
    },
    'e64iahlz': {
      'en': '1',
      'sw': '1',
    },
    '3v1dw0lt': {
      'en': '2',
      'sw': '2',
    },
    'cfp7si89': {
      'en': '3',
      'sw': '3',
    },
    'kwkz0b0h': {
      'en': '4',
      'sw': '4',
    },
    'vxxc2glr': {
      'en': '5',
      'sw': '5',
    },
    'lonb0ll5': {
      'en': '6',
      'sw': '6',
    },
    'p7qqvo9b': {
      'en': '7',
      'sw': '7',
    },
    'bxavnv7r': {
      'en': '8',
      'sw': '8',
    },
    '0zkdu0gz': {
      'en': '9',
      'sw': '9',
    },
    '2680dcwh': {
      'en': '10',
      'sw': '10',
    },
    'kz5zzqqi': {
      'en': '11',
      'sw': '11',
    },
    'vaa1kls8': {
      'en': '12',
      'sw': '12',
    },
    'xlc5s9y4': {
      'en': '13',
      'sw': '13',
    },
    'ej4jgqfl': {
      'en': '14',
      'sw': '14',
    },
    '4e54a8qm': {
      'en': '15',
      'sw': '15',
    },
    '5w07e7x7': {
      'en': '16',
      'sw': '16',
    },
    '2z6i6ffv': {
      'en': '17',
      'sw': '17',
    },
    '6btlj18v': {
      'en': '18',
      'sw': '18',
    },
    'ee5289ew': {
      'en': '19',
      'sw': '19',
    },
    'k12thwdo': {
      'en': '20',
      'sw': '20',
    },
    'eu35e8fg': {
      'en': '21',
      'sw': '21',
    },
    'e9jif8vi': {
      'en': '22',
      'sw': '22',
    },
    'ihpvu79j': {
      'en': '23',
      'sw': '23',
    },
    'dy79yil4': {
      'en': '24',
      'sw': '24',
    },
    'tf669eav': {
      'en': '25',
      'sw': '25',
    },
    '27828n8y': {
      'en': '26',
      'sw': '26',
    },
    'ifz7plve': {
      'en': '27',
      'sw': '27',
    },
    'vqe3ncqe': {
      'en': '28',
      'sw': '28',
    },
    '7acgc9dm': {
      'en': '29',
      'sw': '29',
    },
    'fcgqyslm': {
      'en': '30',
      'sw': '30',
    },
    'misqsiwl': {
      'en': '31',
      'sw': '31',
    },
    '1vfjllrx': {
      'en': 'Upcoming Meetings',
      'sw': 'Mikutano Ijayo',
    },
    'f4emsxed': {
      'en': 'Project Kickoff Meeting',
      'sw': 'Mkutano wa Kuanza kwa Mradi',
    },
    'ii5c1bpl': {
      'en': 'October 10, 2023 • 10:00 AM - 11:30 AM',
      'sw': '10 Oktoba 2023 • 10:00 AM - 11:30 AM',
    },
    'ei8zww3l': {
      'en': 'Conference Room A',
      'sw': 'Chumba cha Mikutano A',
    },
    'n8r89ocz': {
      'en': 'Marketing Team, Product Team',
      'sw': 'Timu ya Uuzaji, Timu ya Bidhaa',
    },
    'kl996yo3': {
      'en':
          'Discuss Q4 marketing strategy and product roadmap for the upcoming release.',
      'sw':
          'Jadili mkakati wa uuzaji wa Q4 na ramani ya bidhaa kwa toleo lijalo.',
    },
    '00qntg31': {
      'en': 'Quarterly Review',
      'sw': 'Tathmini ya Kila Robo',
    },
    '5ynk8kxr': {
      'en': 'October 22, 2023 • 2:00 PM - 4:00 PM',
      'sw': 'Oktoba 22, 2023 • 2:00 PM - 4:00 PM',
    },
    'jq84m46x': {
      'en': 'Calender',
      'sw': 'Kalenda',
    },
  },
  // eventsupdatesPageCopy
  {
    'r9oeolie': {
      'en': 'Event Updates',
      'sw': 'Sasisho za Tukio',
    },
    '7t6jzujc': {
      'en': 'Dodoma, Tanzania',
      'sw': 'Dodoma, Tanzania',
    },
    '96ohtzp2': {
      'en': '3,872 likes',
      'sw': '3,872 zilizopendwa',
    },
    '5q7stch5': {
      'en': 'dj_nightowl ',
      'sw': 'dj_nightowl',
    },
    'vpjk9tpw': {
      'en':
          'Getting ready to drop the beat at tonight\'s afterparty! Come find me at the VIP lounge from midnight. Limited spots available! #AfterpartyVibes #DJLife',
      'sw':
          'Kujitayarisha kudondosha wimbo kwenye karamu ya jioni ya leo! Njoo unitafute kwenye sebule ya watu mashuhuri kuanzia saa sita usiku. Nafasi chache zinapatikana! #AfterpartyVibes #DJLife',
    },
    '32rwt117': {
      'en': 'View all 143 comments',
      'sw': 'Tazama maoni yote 143',
    },
    'wp4d5svt': {
      'en': '45 MINUTES AGO',
      'sw': 'DAKIKA 45 ZILIZOPITA',
    },
    'b046xhfy': {
      'en': 'gourmet_bites',
      'sw': 'gourmet_bites',
    },
    'kku7o2o3': {
      'en': 'Food Court - Zone B',
      'sw': 'Uwanja wa Chakula - Kanda B',
    },
    'mauht3wj': {
      'en': '956 likes',
      'sw': '956 zilizopendwa',
    },
    'ei4jeeu0': {
      'en': 'gourmet_bites ',
      'sw': 'gourmet_bites',
    },
    'llh1esgj': {
      'en':
          'Fresh off the grill! Our special festival menu is a hit! Stop by Zone B before 8PM for our happy hour special - buy one get one free on all signature sliders! #FestivalFood #FoodieHeaven',
      'sw':
          'Safi kutoka kwenye grill! Menyu yetu maalum ya tamasha ni maarufu! Simama Kanda B kabla ya 8PM kwa saa yetu maalum ya furaha - nunua moja upate moja bila malipo kwenye vitelezi vyote vilivyo sahihi! #Chakula cha Sikukuu #FoodieHeaven',
    },
    '7oidiuvs': {
      'en': 'View all 52 comments',
      'sw': 'Tazama maoni yote 52',
    },
    '98gx36dy': {
      'en': '1 HOUR AGO',
      'sw': 'SAA 1 ILIYOPITA',
    },
  },
  // meetingUpdatesCopy
  {
    '16wexkfl': {
      'en': 'HR COMMITTEE METINGS',
      'sw': 'MIKUTANO YA KAMATI YA WATUMISHI',
    },
    'g5bcbdfr': {
      'en': 'Search meetings...',
      'sw': 'Tafuta mikutano...',
    },
    'iivxj6ra': {
      'en': 'Board Meeting',
      'sw': 'Mkutano wa Bodi',
    },
    '5q0ib3ch': {
      'en': 'March 15, 2024 • 10:30 AM',
      'sw': 'Machi 15, 2024 • 10:30 AM',
    },
    'fnzmqv1x': {
      'en': 'Documents (3)',
      'sw': 'Nyaraka (3)',
    },
    'everhap1': {
      'en': 'Q1 Financial Report.pdf',
      'sw': 'Ripoti ya Fedha ya Q1.pdf',
    },
    'm7tr30fo': {
      'en': '2.4 MB • Added by John Smith',
      'sw': '2.4 MB • Imeongezwa na John Smith',
    },
    'x8ybqycg': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'trx4kuja': {
      'en': 'Strategic Plan 2024.pdf',
      'sw': 'Mpango Mkakati 2024.pdf',
    },
    'okcxjvw4': {
      'en': '3.7 MB • Added by Sarah Johnson',
      'sw': '3.7 MB • Imeongezwa na Sarah Johnson',
    },
    '6js7jpl3': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    '094dxorc': {
      'en': 'Board Resolution 42.pdf',
      'sw': 'Azimio la Bodi 42.pdf',
    },
    'cdax53hb': {
      'en': '1.2 MB • Added by Michael Chen',
      'sw': 'MB 1.2 • Imeongezwa na Michael Chen',
    },
    'gt6jw54x': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'xfg5ofxp': {
      'en': 'Executive Committee',
      'sw': 'Kamati ya Utendaji',
    },
    'j0eqe7sh': {
      'en': 'March 8, 2024 • 2:00 PM',
      'sw': 'Tarehe 8 Machi 2024 • 2:00 PM',
    },
    '2nhh31kf': {
      'en': 'Documents (2)',
      'sw': 'Nyaraka (2)',
    },
    'ndvxo30d': {
      'en': 'Executive Summary.pdf',
      'sw': 'Muhtasari wa Mtendaji.pdf',
    },
    'iifyx8mq': {
      'en': '1.8 MB • Added by Emily Davis',
      'sw': 'MB 1.8 • Imeongezwa na Emily Davis',
    },
    '20nu590b': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'r6rio8ce': {
      'en': 'Budget Proposal.pdf',
      'sw': 'Pendekezo la Bajeti.pdf',
    },
    'vmhb3d31': {
      'en': '4.2 MB • Added by Robert Kim',
      'sw': '4.2 MB • Imeongezwa na Robert Kim',
    },
    '76cfbzk0': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'qwv1ivw3': {
      'en': 'Project Team Alpha',
      'sw': 'Timu ya Mradi Alpha',
    },
    'yyg41qen': {
      'en': 'March 1, 2024 • 9:00 AM',
      'sw': 'Tarehe 1 Machi 2024 • 9:00 AM',
    },
    '6w08tnex': {
      'en': 'Documents (4)',
      'sw': 'Nyaraka (4)',
    },
    'b8s8bztz': {
      'en': 'Project Timeline.pdf',
      'sw': 'Ratiba ya Mradi.pdf',
    },
    '8cwk1h57': {
      'en': '2.1 MB • Added by Jessica Wong',
      'sw': 'MB 2.1 • Imeongezwa na Jessica Wong',
    },
    's1lu74o0': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'v9zfbtb4': {
      'en': 'Resource Allocation.pdf',
      'sw': 'Ugawaji wa Rasilimali.pdf',
    },
    'r5ib1s3a': {
      'en': '1.5 MB • Added by David Martinez',
      'sw': 'MB 1.5 • Imeongezwa na David Martinez',
    },
    'uhhpdlq8': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
  },
  // folderDetailsPreview
  {
    '4urvvbsp': {
      'en': 'Search meetings...',
      'sw': 'Tafuta mikutano...',
    },
    'lwppen87': {
      'en': 'Documents',
      'sw': 'Nyaraka',
    },
    'jz8465cj': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
  },
  // documentPreview
  {
    'jp9enuzp': {
      'en': 'Comments',
      'sw': 'Maoni',
    },
    '77tq8nsi': {
      'en': 'Add a comment...',
      'sw': 'Ongeza maoni...',
    },
  },
  // eventsupdatesPageCopy2Org
  {
    'eh4wfmam': {
      'en': 'Event Updates',
      'sw': 'Sasisho za Tukio',
    },
    's8bqthke': {
      'en': 'Dodoma, Tanzania',
      'sw': 'Dodoma, Tanzania',
    },
    'nqs9hbem': {
      'en': '  ',
      'sw': '',
    },
  },
  // BoardMemberProfile
  {
    '7xn8exsp': {
      'en':
          'Welcome back! This platform is designed to help you organize all your Azania Bank board meetings efficiently.',
      'sw':
          'Karibu tena! Jukwaa hili limeundwa ili kukusaidia kupanga mikutano yako yote ya bodi ya Azania Bank kwa ufanisi.',
    },
    'i9k6bxj6': {
      'en': 'My Board / Committee\'s',
      'sw': 'Bodi/Kamati yangu',
    },
    'quvwm7pp': {
      'en': 'FULL BOARD',
      'sw': 'BODI KAMILI',
    },
    '2b12fiku': {
      'en': 'Committee',
      'sw': 'Kamati',
    },
    'vcxri2o9': {
      'en': 'Committee',
      'sw': 'Kamati',
    },
    'xbni2fbi': {
      'en': '56.4k',
      'sw': '56.4k',
    },
    'a31h2sx6': {
      'en': 'Customers',
      'sw': 'Wateja',
    },
    'lsiifzab': {
      'en': '56.4k',
      'sw': '56.4k',
    },
    '6amvizlh': {
      'en': 'Customers',
      'sw': 'Wateja',
    },
    'm6xnpf35': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // meetingCalender
  {
    'qzfss9zy': {
      'en': 'Meeting Calendar',
      'sw': 'Kalenda ya Mkutano',
    },
    '6zlxebcg': {
      'en': 'Upcoming',
      'sw': 'Ijayo',
    },
    '6qnqpe7r': {
      'en': 'Passed',
      'sw': 'Imepitishwa',
    },
    'xuqlkodt': {
      'en': 'Calender',
      'sw': 'Kalenda',
    },
  },
  // pdfDocumentPreview
  {
    '0p0agf2f': {
      'en': 'PDF Viewer',
      'sw': 'Kitazamaji cha PDF',
    },
    '5xos9cl7': {
      'en': 'Document Name',
      'sw': 'Jina la Hati',
    },
    'o67xngvi': {
      'en': 'PDF • 2.4 MB',
      'sw': 'PDF • 2.4 MB',
    },
    'ptulrjru': {
      'en': 'viewpdf',
      'sw': 'viewpdf',
    },
  },
  // meetingUpdatesCopy2bkp
  {
    'viv5clwj': {
      'en': 'Meeting Summaries',
      'sw': 'Muhtasari wa Mkutano',
    },
    'h6t9ewel': {
      'en': 'Search meetings...',
      'sw': 'Tafuta mikutano...',
    },
    '5qjkeuyw': {
      'en': 'Executive Committee',
      'sw': 'Kamati ya Utendaji',
    },
    '53kiity6': {
      'en': 'March 8, 2024 • 2:00 PM',
      'sw': 'Tarehe 8 Machi 2024 • 2:00 PM',
    },
    'auvqldq0': {
      'en': 'Documents (2)',
      'sw': 'Nyaraka (2)',
    },
    'rdh8bts1': {
      'en': 'Executive Summary.pdf',
      'sw': 'Muhtasari wa Mtendaji.pdf',
    },
    'as5gvi1w': {
      'en': '1.8 MB • Added by Emily Davis',
      'sw': 'MB 1.8 • Imeongezwa na Emily Davis',
    },
    'hmjbrtjx': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'ej0neu53': {
      'en': 'Budget Proposal.pdf',
      'sw': 'Pendekezo la Bajeti.pdf',
    },
    'vogd21aq': {
      'en': '4.2 MB • Added by Robert Kim',
      'sw': '4.2 MB • Imeongezwa na Robert Kim',
    },
    '7k2sxoss': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'pgxh0rm1': {
      'en': 'Project Team Alpha',
      'sw': 'Timu ya Mradi Alpha',
    },
    'icgu0s74': {
      'en': 'March 1, 2024 • 9:00 AM',
      'sw': 'Tarehe 1 Machi 2024 • 9:00 AM',
    },
    '8algqrsq': {
      'en': 'Documents (4)',
      'sw': 'Nyaraka (4)',
    },
    '9zgn7iiw': {
      'en': 'Project Timeline.pdf',
      'sw': 'Ratiba ya Mradi.pdf',
    },
    'bgfw1mua': {
      'en': '2.1 MB • Added by Jessica Wong',
      'sw': 'MB 2.1 • Imeongezwa na Jessica Wong',
    },
    '270zn3zq': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
    'yc42ci1x': {
      'en': 'Resource Allocation.pdf',
      'sw': 'Ugawaji wa Rasilimali.pdf',
    },
    '7qv0tk0m': {
      'en': '1.5 MB • Added by David Martinez',
      'sw': 'MB 1.5 • Imeongezwa na David Martinez',
    },
    'i33zvj7g': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
  },
  // eventsupdatesPage
  {
    'dcebwolm': {
      'en': 'Event Updates',
      'sw': 'Sasisho za Tukio',
    },
    'pkwsocpt': {
      'en': 'Dodoma, Tanzania',
      'sw': 'Dodoma, Tanzania',
    },
    'eth8twjt': {
      'en': '  ',
      'sw': '',
    },
    'biaz9fzh': {
      'en': 'Events',
      'sw': 'Matukio',
    },
  },
  // meetingCalenderCopy
  {
    'rdht73hv': {
      'en': 'Meeting Calendar',
      'sw': 'Kalenda ya Mkutano',
    },
    '3bq7pl89': {
      'en': 'Upcoming Meetings',
      'sw': 'Mikutano Ijayo',
    },
    'e3abqbam': {
      'en': 'Project Kickoff Meeting',
      'sw': 'Mkutano wa Kuanza kwa Mradi',
    },
    'o1qqbdy2': {
      'en': 'October 10, 2023 • 10:00 AM - 11:30 AM',
      'sw': '10 Oktoba 2023 • 10:00 AM - 11:30 AM',
    },
    '5dyhxijw': {
      'en': 'Conference Room A',
      'sw': 'Chumba cha Mikutano A',
    },
    'moxpr8qe': {
      'en': 'Marketing Team, Product Team',
      'sw': 'Timu ya Uuzaji, Timu ya Bidhaa',
    },
    'yk1jahct': {
      'en':
          'Discuss Q4 marketing strategy and product roadmap for the upcoming release.',
      'sw':
          'Jadili mkakati wa uuzaji wa Q4 na ramani ya bidhaa kwa toleo lijalo.',
    },
    '1stmykf1': {
      'en': 'Quarterly Review',
      'sw': 'Tathmini ya Kila Robo',
    },
    'c4vje4yc': {
      'en': 'October 22, 2023 • 2:00 PM - 4:00 PM',
      'sw': 'Oktoba 22, 2023 • 2:00 PM - 4:00 PM',
    },
    '7imo8kpo': {
      'en': 'Calender',
      'sw': 'Kalenda',
    },
  },
  // alertPasowrd
  {
    'znjjzzom': {
      'en': 'Invalid Credentials',
      'sw': 'Vitambulisho Batili',
    },
    'v24qwa0o': {
      'en':
          'The username or password you entered is incorrect. Please check your credentials and try again.',
      'sw':
          'Jina la mtumiaji au nenosiri uliloweka si sahihi. Tafadhali angalia stakabadhi zako na ujaribu tena.',
    },
    'qtg8mwgp': {
      'en': 'Try Again',
      'sw': 'Jaribu Tena',
    },
  },
  // buttomSheet
  {
    'fnk4amhi': {
      'en': 'Edit Post',
      'sw': 'Hariri Chapisho',
    },
    'l4qtymao': {
      'en': 'Delete Story',
      'sw': 'Futa Hadithi',
    },
    '6abga9bf': {
      'en': 'Cancel',
      'sw': 'Ghairi',
    },
  },
  // ButtonSheetForLogin
  {
    'yvuhvgn2': {
      'en': 'Try Again',
      'sw': 'Jaribu Tena',
    },
  },
  // documentListData
  {
    't11xgreh': {
      'en': 'Preview',
      'sw': 'Hakiki',
    },
  },
  // meetingListNew
  {
    'w4qqzo4a': {
      'en': 'Upcoming Meetings',
      'sw': 'Mikutano Ijayo',
    },
    'f2rztcuc': {
      'en': '10',
      'sw': '10',
    },
    'en8aaeqn': {
      'en': 'MAY',
      'sw': 'MEI',
    },
    '1vprm84u': {
      'en': 'Weekly Team Sync',
      'sw': 'Usawazishaji wa Timu ya Kila Wiki',
    },
    '0q6aksmt': {
      'en': '10:00 AM - 11:00 AM',
      'sw': '10:00 AM - 11:00 AM',
    },
    '41xe4m6j': {
      'en': '12',
      'sw': '12',
    },
    'cvma9e8t': {
      'en': 'MAY',
      'sw': 'MEI',
    },
    'sbir7kfk': {
      'en': 'Client Presentation',
      'sw': 'Uwasilishaji wa Mteja',
    },
    '7nhprgz0': {
      'en': '2:00 PM - 3:30 PM',
      'sw': '2:00 PM - 3:30 PM',
    },
    'szgltm5e': {
      'en': '15',
      'sw': '15',
    },
    'fyovl0kh': {
      'en': 'MAY',
      'sw': 'MEI',
    },
    'hhcjkfbc': {
      'en': 'Product Planning',
      'sw': 'Upangaji wa Bidhaa',
    },
    'jjvinxlw': {
      'en': '9:30 AM - 11:00 AM',
      'sw': '9:30 AM - 11:00 AM',
    },
  },
  // drawcoment
  {
    '41dw5i26': {
      'en': 'Write Your Comments',
      'sw': 'Andika Maoni Yako',
    },
    'mx1o8wd3': {
      'en': 'Use your finger to draw or pen',
      'sw': 'Tumia kidole chako kuchora au kalamu',
    },
  },
  // Miscellaneous
  {
    '3vhwlkmd': {
      'en': '',
      'sw': '',
    },
    'rj6sai77': {
      'en': '',
      'sw': '',
    },
    'zf0efunb': {
      'en': '',
      'sw': '',
    },
    '7b1b5epf': {
      'en': '',
      'sw': '',
    },
    'x674ifeh': {
      'en': '',
      'sw': '',
    },
    '61pp1y4j': {
      'en': '',
      'sw': '',
    },
    'tsaumbh2': {
      'en': '',
      'sw': '',
    },
    '1lpqpkjt': {
      'en': '',
      'sw': '',
    },
    '1slnq11f': {
      'en': '',
      'sw': '',
    },
    '4qjrruxf': {
      'en': '',
      'sw': '',
    },
    'j2szmjlg': {
      'en': '',
      'sw': '',
    },
    '1e1isfft': {
      'en': '',
      'sw': '',
    },
    'q1f3w5jj': {
      'en': '',
      'sw': '',
    },
    'dosphrwv': {
      'en': '',
      'sw': '',
    },
    'myvm1k60': {
      'en': '',
      'sw': '',
    },
    '2jtzobnc': {
      'en': '',
      'sw': '',
    },
    'nn0umbn8': {
      'en': '',
      'sw': '',
    },
    'uwmc6ms0': {
      'en': '',
      'sw': '',
    },
    '38hkv1jo': {
      'en': '',
      'sw': '',
    },
    '2wf273vk': {
      'en': '',
      'sw': '',
    },
    'z6j3nwos': {
      'en': '',
      'sw': '',
    },
    'ghr2j73p': {
      'en': '',
      'sw': '',
    },
    'ueb3e4us': {
      'en': '',
      'sw': '',
    },
    'whq7icmt': {
      'en': '',
      'sw': '',
    },
    'xi44knt8': {
      'en': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
