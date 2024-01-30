abstract class SettingsState {
  // const SettingsState();

  // @override
  // List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsChangeThemeState extends SettingsState {}

class SettingsChangeLangState extends SettingsState {}

class SettingsGetLangFromCacheSuccessState extends SettingsState {}

class SettingsGetLangFromCacheErrorState extends SettingsState {}

class SettingsGetLangFromCacheLoadingState extends SettingsState {}

class SettingsGetThemeFromCacheSuccessState extends SettingsState {}

class SettingsGetThemeFromCacheErrorState extends SettingsState {}

class SettingsGetThemeFromCacheLoadingState extends SettingsState {}
