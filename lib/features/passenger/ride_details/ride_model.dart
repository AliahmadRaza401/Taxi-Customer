class RideModel {
  final String id;
  final String date;
  final String time;
  final String pickupLocation;
  final String dropoffLocation;
  final double fare;
  final String status;
  final String driverName;
  final String driverCode;
  final String driverVehicle;
  final double distance;
  final int duration;
  final double serviceFee;
  final double waitingFee;
  final double rideCharges;
  final double peakFactor;

  RideModel({
    required this.id,
    required this.date,
    required this.time,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.fare,
    required this.status,
    required this.driverName,
    required this.driverCode,
    required this.driverVehicle,
    required this.distance,
    required this.duration,
    required this.serviceFee,
    required this.waitingFee,
    required this.rideCharges,
    required this.peakFactor,
  });
}
