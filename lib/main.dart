import 'package:example/api/api.dart';
import 'package:example/features/search/bloc/rhymer_list_bloc.dart';
import 'package:example/router/router.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final client = RhymerApiClient.create(apiUrl: dotenv.env["API_URL"]);
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RhymerListBloc(
        apiClient: RhymerApiClient.create(
          apiUrl: dotenv.env["API_URL"],
        ),
      ),
      child: MaterialApp.router(
        title: 'Rhymer',
        theme: themeData,
        routerConfig: _router.config(),
      ),
    );
  }
}
