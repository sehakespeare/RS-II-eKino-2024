import 'package:e_kino_mobile/models/transaction.dart';
import 'package:e_kino_mobile/providers/transaction_provider.dart';
import 'package:e_kino_mobile/screens/drawer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../../providers/stripe_provider.dart';
import '../../utils/util.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Map<String, dynamic>? paymentIntentData;
  Transaction? data;
  TransactionProvider? _transactionProvider;
  StripeProvider? _stripeProvider;

  @override
  void initState() {
    _transactionProvider = TransactionProvider();
    _stripeProvider = StripeProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount = CartRouteData.projection != null
        ? (CartRouteData.projection!.ticketPrice! *
                (CartRouteData.reservationSaveValue!['numTickets']))
            .toStringAsFixed(0)
        : '';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Korpa',
          style: TextStyle(fontSize: 18),
        ),
      ),
      drawer: const DrawerNavigation(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (CartRouteData.projection != null)
                Column(
                  children: [
                    const Text(
                      "Artikli u korpi",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    ListTile(
                      title: Text(
                        "Film: ${CartRouteData.projection?.movie?.title}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Datum projekcije: ${DateFormat('dd.MM.yyyy HH:mm').format(CartRouteData.projection!.dateOfProjection)}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Količina: ${CartRouteData.reservationSaveValue?['numTickets'] ?? 0}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Cijena karte: \$${CartRouteData.projection!.ticketPrice!.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      trailing: Text(
                        "\$$totalAmount",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              if (CartRouteData.transactionSaveValue != null)
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(8, 17, 184, 0.6),
                      foregroundColor: Colors.white),
                  onPressed: () => makePayment(
                    double.parse(totalAmount),
                  ),
                  child: const Text(
                    'Plaćanje',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePayment(double iznos) async {
    try {
      paymentIntentData = await _stripeProvider?.createPaymentIntent(
          (iznos * 100).round().toString(), 'bam');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  style: ThemeMode.dark,
                  merchantDisplayName: 'eKino'))
          .then((value) {})
          .onError((error, stackTrace) {
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Text("Poništena transakcija!"),
                ));
        throw Exception("Plaćanje odbijeno");
      });

      try {
        await Stripe.instance.presentPaymentSheet();

        await insertUplata(CartRouteData.reservationId!);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Uplata uspješna!"),
          backgroundColor: Color.fromARGB(255, 46, 232, 133),
        ));

        CartRouteData.reservationSaveValue = null;
        CartRouteData.transactionSaveValue = null;
        CartRouteData.projection = null;
        setState(() {});
      } catch (e) {
        Exception(e);
      }
    } catch (e, s) {
      Exception('$e,$s');
    }
  }

  Future<void> insertUplata(int transactionId) async {
    Map transakcija = {
      "userId": int.parse(CartRouteData.transactionSaveValue?['userId']),
      "reservationId": transactionId,
      "amount": double.tryParse(CartRouteData.transactionSaveValue?['amount'])!
          .truncate(),
      "dateOfTransaction": DateTime.now().toIso8601String()
    };

    await _transactionProvider!.placanje(transakcija);
  }
}
