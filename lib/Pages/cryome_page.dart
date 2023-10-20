import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CryomePage extends StatefulWidget {
  const CryomePage({super.key});

  @override
  State<CryomePage> createState() => _CryomePageState();
}

class _CryomePageState extends State<CryomePage> {
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latlang =[LatLng(20.258652, 61.192383),
    LatLng(12.258652, 51.192383)];

  late GoogleMapController _mapController;
  Map<String , Marker> _marker = {};
  static const LatLng currentLocation = LatLng(22.258652, 71.192383);
  static const LatLng _pApplePark = LatLng(22.258652, 71.192383);
  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    loadData();
  }
  loadData(){
    for(int i =0;i<_latlang.length;i++)
      {


    _markers.add(Marker(markerId: MarkerId(i.toString()) , icon: BitmapDescriptor.defaultMarker,
    position: _latlang[i],
    onTap: () {
      _customInfoWindowController.addInfoWindow!(
              Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                  color:  Colors.black38,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:300 ,
                      height:100 ,
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/pexels-alex-fu-15168538.jpg'),fit: BoxFit.fitWidth,
                        filterQuality: FilterQuality.high,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)
                        ),
                        color: Colors.black54,
                      ),
                    )

                  ],
                ),

              ),
              _latlang[i]
      );

    }
    ));
      setState(() { });}
  }

  @override
  Widget build(BuildContext context) {
    return
       Stack(
        children:[GoogleMap(
          initialCameraPosition: CameraPosition(target:currentLocation , zoom: 1
          ),

          onTap:(position){

          },
          onCameraMove: (position){
            _customInfoWindowController.onCameraMove!();

          },

          onMapCreated: (GoogleMapController Controller) {
           _customInfoWindowController.googleMapController = Controller;
          },
          markers: Set<Marker>.of(_markers)

        ),
          CustomInfoWindow(controller: _customInfoWindowController,
          height: 200,
              width: 200,
              offset: 35,)
    ],
      );

    }

}



