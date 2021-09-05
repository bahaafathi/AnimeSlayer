import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myanime/cubits/changelog.dart';
import 'package:myanime/cubits/ova.dart';
import 'package:myanime/cubits/special.dart';
import 'package:myanime/cubits/top.dart';
import 'package:myanime/cubits/upcoming.dart';
import 'package:myanime/repositories/changelog.dart';
import 'package:myanime/repositories/details.dart';
import 'package:myanime/repositories/movies.dart';
import 'package:myanime/repositories/ova.dart';
import 'package:myanime/repositories/pictures.dart';
import 'package:myanime/repositories/search.dart';
import 'package:myanime/repositories/special.dart';
import 'package:myanime/repositories/top.dart';
import 'package:myanime/repositories/upcoming.dart';
import 'package:myanime/services/changelog.dart';
import 'package:myanime/services/details.dart';
import 'package:myanime/services/movie.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/services/search.dart';
import 'package:myanime/services/special.dart';
import 'package:myanime/services/top.dart';
import 'package:myanime/services/upcoming.dart';
import 'package:myanime/ui/start.dart';
import 'package:myanime/utils/bloc_observer.dart';
import 'package:myanime/utils/routes.dart';
import 'package:myanime/utils/url.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubits/browser.dart';
import 'cubits/details.dart';
import 'cubits/image_quality.dart';
import 'cubits/movies.dart';
import 'cubits/pictures.dart';
import 'cubits/search.dart';
import 'cubits/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final httpClient = Dio();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  runApp(
    MyApp(
      moviesRepository: MoviesRepository(MoviesService(httpClient)),
      ovaRepository: OvaRepository(OvaService(httpClient)),
      specialRepository: SpecialRepository(SpecialService(httpClient)),
      topRepository: TopRepository(TopService(httpClient)),
      upcomingRepository: UpcomingRepository(UpcomingService(httpClient)),
      detailsRepository: DetailsRepository(DetailsService(httpClient)),
      changelogRepository: ChangelogRepository(ChangelogService(httpClient)),
      searchRepository: SearchRepository(SearchService(httpClient)),
      picturesRepository: PicturesRepository(DetailsService(httpClient)),
    ),
  );

  Bloc.observer = MyBlocObserver();

  // print('_________________________________________');
  // var data = await DetailsRepository(DetailsService(Dio())).fetchData(id: 1);
  // print(data.title);
  // print('_________________________________________');
  // var data = await SearchRepository(SearchService(httpClient)).fetchData();
  // print(data.results[0].title);
  var data =
      await PicturesRepository(DetailsService(httpClient)).fetchData(id: 1);
  print(data.pictures[0].large);
}

class MyApp extends StatelessWidget {
  final MoviesRepository moviesRepository;
  final TopRepository topRepository;
  final SpecialRepository specialRepository;
  final UpcomingRepository upcomingRepository;
  final OvaRepository ovaRepository;
  final ChangelogRepository changelogRepository;
  final DetailsRepository detailsRepository;
  final SearchRepository searchRepository;
  final PicturesRepository picturesRepository;
  const MyApp({
    Key key,
    this.moviesRepository,
    this.topRepository,
    this.specialRepository,
    this.upcomingRepository,
    this.changelogRepository,
    this.ovaRepository,
    this.detailsRepository,
    this.searchRepository,
    this.picturesRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DetailsCubit(detailsRepository)),
          BlocProvider(create: (_) => ChangelogCubit(changelogRepository)),
          BlocProvider(create: (_) => ImageQualityCubit()),
          BlocProvider(create: (_) => BrowserCubit()),
          BlocProvider(create: (_) => SearchCubit(searchRepository)),
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => MoviesCubit(moviesRepository)),
          BlocProvider(create: (_) => TopCubit(topRepository)),
          BlocProvider(create: (_) => SpecialCubit(specialRepository)),
          BlocProvider(create: (_) => UpcomingCubit(upcomingRepository)),
          BlocProvider(create: (_) => OvaCubit(ovaRepository)),
          BlocProvider(create: (_) => PicturesCubit(picturesRepository)),
        ],
        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: null,
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: context.watch<ThemeCubit>().lightTheme,
              darkTheme: context.watch<ThemeCubit>().darkTheme,
              themeMode: context.watch<ThemeCubit>().themeMode,
              onGenerateRoute: Routes.generateRoute,
              onUnknownRoute: Routes.errorRoute,
              localizationsDelegates: [
                FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(),
                )..load(null),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
            );
          },
        ));
  }
}
