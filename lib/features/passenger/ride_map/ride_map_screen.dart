import 'package:flutter/material.dart';
import 'package:game_on/features/passenger/ride_map/ride_map_controller.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideMapScreen extends StatelessWidget {
  const RideMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RideMapController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        final ride = controller.selectedRide.value;
        if (ride == null) return Center(child: Text('No ride data'));
        
        return Stack(
          children: [
            //  =============== Google Map ======================
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: controller.initialPosition.value,
                zoom: 14.0,
              ),
              onMapCreated: (GoogleMapController mapController) {
                controller.onMapCreated(mapController);
              },
              markers: controller.markers.toSet(),
              polylines: controller.polylines.toSet(),
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            ),
            // ================== Bottom info card ================== 
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ride.date}, ${ride.time}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₦ ${ride.fare.toInt()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

// // Custom painters for map simulation
// class RoadPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.grey[300]!
//       ..strokeWidth = 3;

//     // Draw some roads
//     canvas.drawLine(Offset(0, size.height * 0.3), Offset(size.width, size.height * 0.3), paint);
//     canvas.drawLine(Offset(0, size.height * 0.7), Offset(size.width, size.height * 0.7), paint);
//     canvas.drawLine(Offset(size.width * 0.3, 0), Offset(size.width * 0.3, size.height), paint);
//     canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.7, size.height), paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

// class RoutePainter extends CustomPainter {

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 4
//       ..style = PaintingStyle.stroke;

//     final path = Path();
//     path.moveTo(80 + 20, 200 + 20);
//     path.quadraticBezierTo(
//       size.width * 0.5,
//       size.height * 0.4,
//       size.width - 80 - 20,
//       size.height - 200 - 20,
//     );

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }

