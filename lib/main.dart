import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_request_bloc/widgets/request_builder.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myanime/cubits/ova.dart';
import 'package:myanime/cubits/special.dart';
import 'package:myanime/cubits/top.dart';
import 'package:myanime/cubits/upcoming.dart';
import 'package:myanime/models/movies.dart';
import 'package:myanime/repositories/movies.dart';
import 'package:myanime/repositories/ova.dart';
import 'package:myanime/repositories/special.dart';
import 'package:myanime/repositories/top.dart';
import 'package:myanime/repositories/upcoming.dart';
import 'package:myanime/services/movie.dart';
import 'package:myanime/services/ova.dart';
import 'package:myanime/services/special.dart';
import 'package:myanime/services/top.dart';
import 'package:myanime/services/upcoming.dart';
import 'package:myanime/ui/start.dart';
import 'package:myanime/utils/bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

import 'cubits/browser.dart';
import 'cubits/image_quality.dart';
import 'cubits/movies.dart';
import 'cubits/theme.dart';

void main() async {
  final httpClient = Dio();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(MyApp(
    moviesRepository: MoviesRepository(MoviesService(httpClient)),
    ovaRepository: OvaRepository(OvaService(httpClient)),
    specialRepository: SpecialRepository(SpecialService(httpClient)),
    topRepository: TopRepository(TopService(httpClient)),
    upcomingRepository: UpcomingRepository(UpcomingService(httpClient)),
  ));
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  final MoviesRepository moviesRepository;
  final TopRepository topRepository;
  final SpecialRepository specialRepository;
  final UpcomingRepository upcomingRepository;
  final OvaRepository ovaRepository;

  const MyApp(
      {Key key,
      this.moviesRepository,
      this.topRepository,
      this.specialRepository,
      this.upcomingRepository,
      this.ovaRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ImageQualityCubit()),
          BlocProvider(create: (_) => BrowserCubit()),
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => MoviesCubit(moviesRepository)),
          BlocProvider(create: (_) => TopCubit(topRepository)),
          BlocProvider(create: (_) => SpecialCubit(specialRepository)),
          BlocProvider(create: (_) => UpcomingCubit(upcomingRepository)),
          BlocProvider(create: (_) => OvaCubit(ovaRepository)),
        ],
        child: BlocConsumer<ThemeCubit, ThemeState>(
          listener: null,
          builder: (context, state) {
            return MaterialApp(
              theme: context.watch<ThemeCubit>().lightTheme,
              darkTheme: context.watch<ThemeCubit>().darkTheme,
              themeMode: context.watch<ThemeCubit>().themeMode,
              home: StartScreen(),
            );
          },
        ));
  }
}
