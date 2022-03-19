

abstract class AppTranslations {
  static Map<String, Map<String, String>> translationKeys = {
    "en_US": enUS,
    "tr_TR": trTR
  };
}

final Map<String, String> enUS = {'hello': 'Welcome !'};

final Map<String, String> trTR = {'hello': 'Hoşgeldiniz !',
'phoneInput':'kullanıcı adı',
'phoneHint':'lütfen kullanıcı adını giriniz',
'passwordInput':'parola',
'loginTitle':'GİRİŞ',
'emptyInputMessage':'Bu alan boş bırakılamaz.'
};
