import 'package:flutter/material.dart';

class HotelTile extends StatelessWidget {
  final String name, image;
  final double rating;
  final int price;

  const HotelTile({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      margin: const EdgeInsets.only(
        bottom: 10,
        right: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(
                5,
                10,
              ),
            )
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _hotelImage(context),
          _hotelInfo(),
          _hotelRating(),
        ],
      ),
    );
  }

  Widget _hotelImage(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.13;
    return SizedBox(
      height: size,
      width: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _hotelInfo() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "From INR$price",
          style: const TextStyle(
            color: Colors.black45,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

  Widget _hotelRating() {
    return Row(
      children: [
        Text(
          rating.toStringAsFixed(
            1,
          ),
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const Icon(
          Icons.star,
          size: 15,
          color: Colors.purple,
        )
      ],
    );
  }
}
