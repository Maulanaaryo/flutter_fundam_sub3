import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/detail_provider.dart';
import 'package:restaurant_app/widgets/detail_screen.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final String id;

  const RestaurantDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailProvider(apiDetailService: ApiService(), id: id),
      child: Consumer<DetailProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return DetailScreen(restaurant: state.result!.restaurant);
          } else if (state.state == ResultState.NoHasdata) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.HasError) {
            return Scaffold(
              body: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.signal_wifi_connected_no_internet_4_sharp,
                        color: Colors.grey, size: 100),
                    SizedBox(height: 20),
                    Text('Please Check Your Connection.',
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('No Data Detail'),
            );
          }
        },
      ),
    );
  }
}
