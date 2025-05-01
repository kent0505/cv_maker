import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'firebase_options.dart';
import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/core/config/constants.dart';
import 'src/features/home/bloc/home_bloc.dart';
import 'src/features/resume/bloc/resume_bloc.dart';
import 'src/features/resume/data/resume_repository.dart';
import 'src/features/settings/bloc/settings_bloc.dart';
import 'src/features/settings/data/settings_repository.dart';
import 'src/features/onboard/data/onboard_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  await prefs.remove(Keys.onboard);

  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'data.db');
  // await deleteDatabase(path);
  final db = await openDatabase(
    path,
    version: 2,
    onCreate: (db, version) async {
      await db.execute(SQL.resumes);
      await db.execute(SQL.languages);
      await db.execute(SQL.educations);
      await db.execute(SQL.experiences);
      await db.execute(SQL.skills);
      await db.execute(SQL.interests);
    },
    onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion < 2) {
        await db.execute('DROP TABLE IF EXISTS ${Tables.resumes}');
        await db.execute('DROP TABLE IF EXISTS ${Tables.languages}');
        await db.execute('DROP TABLE IF EXISTS ${Tables.educations}');
        await db.execute('DROP TABLE IF EXISTS ${Tables.experiences}');
        await db.execute('DROP TABLE IF EXISTS ${Tables.skills}');
        await db.execute('DROP TABLE IF EXISTS ${Tables.interests}');
        await db.execute(SQL.resumes);
        await db.execute(SQL.languages);
        await db.execute(SQL.educations);
        await db.execute(SQL.experiences);
        await db.execute(SQL.skills);
        await db.execute(SQL.interests);
      }
    },
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<OnboardRepository>(
          create: (context) => OnboardRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepositoryImpl(prefs: prefs),
        ),
        RepositoryProvider<ResumeRepository>(
          create: (context) => ResumeRepositoryImpl(db: db),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(
            create: (context) => SettingsBloc(
              repository: context.read<SettingsRepository>(),
            )..add(GetLanguage()),
          ),
          BlocProvider(
            create: (context) => ResumeBloc(
              repository: context.read<ResumeRepository>(),
            )..add(GetResumes()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          theme: lightTheme,
          routerConfig: routerConfig,
        );
      },
    );
  }
}
