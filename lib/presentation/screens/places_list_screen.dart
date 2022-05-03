import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../application/places_list_screen/places_list_screen_bloc.dart';
import '../widgets/error_message.dart';
import './add_place_screen.dart';
import '../../providers/great_places.dart';
import './place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Expanded(
                child: Center(
                    child: BlocBuilder<PlacesListScreenBloc,
                        PlacesListScreenState>(
                  bloc: BlocProvider.of<PlacesListScreenBloc>(context)
                    ..add(PlacesListRequestedEvent()),
                  builder: (context, placesListState) {
                    if (placesListState is PlacesListScreenInitial) {
                      return Text(
                        "Your Advice is waiting for you!",
                        //style: themeData.textTheme.headline1,
                      );
                    } else if (placesListState is PlacesListScreenLoading) {
                      return CircularProgressIndicator(
                          //color: themeData.colorScheme.secondary,
                          );
                    } else if (placesListState is PlacesListScreenLoaded) {
                      var greatPlaces = placesListState.places;

                      return Center(
                        child: ListView.builder(
                          itemCount: greatPlaces.length,
                          itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                greatPlaces[i].image,
                              ),
                            ),
                            title: Text(greatPlaces[i].title),
                            subtitle: Text(greatPlaces[i].location.address),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                PlaceDetailScreen.routeName,
                                arguments: greatPlaces[i].id,
                              );
                            },
                          ),
                        ),
                      );
                    } else if (placesListState is PlacesListScreenError) {
                      return ErrorMessage(
                        message: placesListState.message,
                      );
                    }
                    return const Placeholder();
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
