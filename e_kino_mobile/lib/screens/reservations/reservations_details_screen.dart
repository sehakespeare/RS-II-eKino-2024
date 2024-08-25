import 'package:e_kino_mobile/models/projection.dart';
import 'package:e_kino_mobile/models/reservation.dart';
import 'package:e_kino_mobile/models/user.dart';
import 'package:e_kino_mobile/providers/projections_provider.dart';
import 'package:e_kino_mobile/providers/reservation_provider.dart';
import 'package:e_kino_mobile/providers/users_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class ReservationDetailsScreen extends StatefulWidget {
  final Reservation? reservation;

  const ReservationDetailsScreen({super.key, this.reservation});

  @override
  State<ReservationDetailsScreen> createState() =>
      _ReservationDetailsScreenState();
}

class _ReservationDetailsScreenState extends State<ReservationDetailsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _formKeySeat = GlobalKey<FormBuilderState>();
  late Map<String, dynamic> _initialValue;
  late UsersProvider _usersProvider;
  late ProjectionsProvider _projectionsProvider;
  late ReservationProvider _reservationProvider;
  List<Users>? _usersList;
  List<Projection>? _projectionsList;
  bool isLoading = true;
  late List<List<bool>> seats;
  List<String> selectedRows = [];

  List<Reservation>? allReservations; // Added to store all reservations

  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<UsersProvider>();
    _projectionsProvider = context.read<ProjectionsProvider>();
    _reservationProvider = context.read<ReservationProvider>();

    _initialValue = {
      "userId": widget.reservation?.userId?.toString(),
      "projectionId": widget.reservation?.projectionId.toString(),
      "row": widget.reservation?.row.toString() ?? '',
      "numTickets": widget.reservation?.numTickets.toString() ?? '',
    };
    initForm();
    seats = List.generate(8, (_) => List.generate(8, (_) => false));
  }

  Future<void> initForm() async {
    final usersResult = await _usersProvider.get();
    _usersList = usersResult.result;
    final projectionsResult = await _projectionsProvider.get();
    _projectionsList = projectionsResult.result;
    final reservationsResult = await _reservationProvider.get();
    allReservations = reservationsResult.result;

    setState(() {
      isLoading = false;
      seats = List.generate(8, (_) => List.generate(8, (_) => false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.reservation != null
              ? 'Detalji rezervacije'
              : 'Nova rezervacija',
          style: const TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildForm(),
              const SizedBox(height: 64),
              CustomPaint(
                size: const Size(1200, 10),
                painter: ScreenPainter(),
              ),
              const SizedBox(height: 48),
              _buildSeatPicker(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return FormBuilder(
      key: _formKey,
      initialValue: _initialValue,
      child: Column(
        children: [
          FormBuilderDropdown<String>(
            name: 'userId',
            decoration: const InputDecoration(labelText: "Korisnik"),
            items: _usersList
                    ?.map((user) => DropdownMenuItem(
                          value: user.userId.toString(),
                          child: Text(user.username ?? ''),
                        ))
                    .toList() ??
                [],
            enabled: false,
          ),
          FormBuilderDropdown<String>(
            name: 'projectionId',
            decoration: const InputDecoration(labelText: "Projekcija"),
            items: _projectionsList
                    ?.map(
                      (projection) => DropdownMenuItem(
                        value: projection.projectionId.toString(),
                        child: Text(projection.movie?.title ?? ''),
                      ),
                    )
                    .toList() ??
                [],
            enabled: false,
          ),
          FormBuilderTextField(
            name: 'row',
            decoration: const InputDecoration(labelText: "Red"),
            enabled: false,
          ),
          FormBuilderTextField(
            name: 'numTickets',
            decoration: const InputDecoration(labelText: "Broj karte"),
            enabled: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSeatPicker() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Odaberi sjedište',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
            ),
            itemCount: 40,
            itemBuilder: (context, index) {
              final row = index ~/ 8;
              final column = index % 8;
              final seatRow = String.fromCharCode(65 + row);
              final seatColumn = column + 1;

              final seatValue = '$seatRow$seatColumn';
              var isReserved = allReservations?.any((reservation) =>
                      reservation.row!.toString().contains(seatValue) &&
                      reservation.projectionId ==
                          int.parse(_initialValue['projectionId'])) ??
                  false;

              var isSelected =
                  _initialValue['row']?.split(',').contains(seatValue);
              isReserved = false;
              isSelected = false;

              Color getColor() {
                if (isReserved) {
                  return Colors.red;
                } else if (isSelected) {
                  return Colors.blue;
                } else {
                  return Colors.grey;
                }
              }

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isReserved) {
                      final selectedSeats =
                          _initialValue['row']?.split(',') ?? [];
                      if (isSelected!) {
                        selectedSeats.remove(seatValue);
                      } else {
                        selectedSeats.add(seatValue);
                      }
                      _formKeySeat.currentState?.fields['row']
                          ?.didChange(selectedSeats.join(','));
                      _initialValue['row'] = selectedSeats.join(',');
                      seats[row][column] = !isSelected;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: getColor(),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '${String.fromCharCode(65 + row)}${column + 1}',
                      style: TextStyle(
                        color:
                            (isReserved == true ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    Offset controlPoint1 = Offset(size.width * 0.25, size.height * 0.75);
    Offset controlPoint2 = Offset(size.width * 0.75, size.height * 0.75);

    Path path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, size.width / 2,
          size.height * 0.25)
      ..quadraticBezierTo(
          controlPoint2.dx, controlPoint2.dy, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
