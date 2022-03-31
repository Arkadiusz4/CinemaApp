import 'package:cinema/domain/entity/language_enitity.dart';

class Languages {
  const Languages._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'pl', value: 'Polish'),
    LanguageEntity(code: 'es', value: 'Spanish'),
    LanguageEntity(code: 'fr', value: 'French'),
    LanguageEntity(code: 'de', value: 'German'),
    LanguageEntity(code: 'it', value: 'Italian'),
  ];
}
