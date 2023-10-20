import 'package:flutter/material.dart';
import 'package:memorydirective/Pages/widgets_travel/hotel_tile.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: [
        _background(context),
        _locationsList(context),
      ],
    );
  }

  Widget _background(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Thailand Islands",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "15 sept 2023 - 18 sept 2023",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationsList(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              15,
            ),
            topLeft: Radius.circular(
              15,
            ),
          ),
        ),
        child: ListView(
          children: const [
            HotelTile(
              name: "Hilton Thai",
              rating: 4.3,
              price: 19500,
              image:
                  "https://images.pexels.com/photos/38238/maldives-ile-beach-sun-38238.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
            HotelTile(
              name: "Four Seasons",
              rating: 4.7,
              price: 45000,
              image:
                  "https://images.pexels.com/photos/1287460/pexels-photo-1287460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
            HotelTile(
              name: "Ritz Carlton",
              rating: 4.5,
              price: 34500,
              image:
                  "https://images.pexels.com/photos/5007356/pexels-photo-5007356.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
            HotelTile(
              name: "Marriott",
              rating: 4.3,
              price: 14500,
              image:
                  "https://images.pexels.com/photos/188030/pexels-photo-188030.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ],
        ),
      ),
    );
  }
}
