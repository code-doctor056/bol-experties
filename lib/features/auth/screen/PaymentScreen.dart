import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Invoice Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Invoice Summary",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildItemRow("Service", "Business Consultation", "150.00"),
                  const SizedBox(height: 12),
                  _buildItemRow("Expert Fee", "John Smith", "50.00"),
                  const Divider(height: 24),
                  _buildSimpleRow("Subtotal", "\$200.00"),
                  _buildSimpleRow("Tax (10%)", "\$20.00"),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Total Amount
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total Amount",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$220.00",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.credit_card, size: 20),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Payment logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Pay Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemRow(String title, String subtitle, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 13, color: Colors.black54)),
              const SizedBox(height: 2),
              Text(subtitle,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ]),
        Text("\$$amount",
            style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildSimpleRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value),
        ],
      ),
    );
  }
}
