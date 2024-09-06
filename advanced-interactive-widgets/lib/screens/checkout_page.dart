import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.cartManager,
    required this.didUpdate,
    required this.onSubmit,
  });

  final CartManager cartManager;
  final Function() didUpdate;
  final Function(Order) onSubmit;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text('Delivery'),
    1: Text('Self Pick-up'),
  };
  Set<int> selectedSegment = {0};
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);
  final TextEditingController _nameController = TextEditingController();

  void onSegmentSelected(Set<int> segmentIndex) {
    setState(() {
      selectedSegment = segmentIndex;
    });
  }

  Widget _buildOrderSegmentedType() {
    return SegmentedButton(
      segments: const [
        ButtonSegment(
          value: 0,
          label: Text('Delivery'),
          icon: Icon(Icons.pedal_bike),
        ),
        ButtonSegment(
          value: 1,
          label: Text('Pickup'),
          icon: Icon(Icons.local_mall),
        ),
      ],
      showSelectedIcon: false,
      selected: selectedSegment,
      onSelectionChanged: onSegmentSelected,
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Contact Name',
      ),
    );
  }

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return 'Select Date';
    }
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: _firstDate,
      lastDate: _lastDate,
      initialDate: selectedDate ?? DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Details',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 16,
            ),
            _buildOrderSegmentedType(),
            const SizedBox(
              height: 16,
            ),
            _buildTextField(),
          ],
        ),
      ),
    );
  }
}
