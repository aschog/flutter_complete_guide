import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './providers/great_places.dart';
import './presentation/screens/places_list_screen.dart';
import './presentation/screens/add_place_screen.dart';
import './presentation/screens/place_detail_screen.dart';
import 'application/places_list_screen/places_list_screen_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
                .copyWith(secondary: Colors.amber),
          ),
          home: BlocProvider(
            create: (context) => PlacesListScreenBloc(),
            child: PlacesListScreen(),
          ),
          routes: {
            AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
            PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
          }),
    );
  }
}
