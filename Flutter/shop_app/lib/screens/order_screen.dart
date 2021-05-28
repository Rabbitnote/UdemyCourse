import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: order.orders.length,
        itemBuilder: (ctx, i) => OrderItem(order.orders[i]),
      ),
    );
  }
}
