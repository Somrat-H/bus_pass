import 'dart:developer';

import 'package:bus_pass/database.dart';
import 'package:bus_pass/screen/login.dart';
import 'package:flutter/material.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final String t = 'Online Bus Ticket Booking System';

  @override
  Widget build(BuildContext context) {
    var tickets = Database.instance.bus.tickets;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://img.lovepik.com/free-png/20220127/lovepik-female-avatar-elements-of-womens-day-png-image_401901116_wh1200.png'),
                    ),
                  ),
                  Text(Database.instance.user!.name),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ticket Booking',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              var navigator = Navigator.of(context);
              await Database.instance.saveUserLoginStatus();
              navigator.pushReplacement(
                MaterialPageRoute(builder: (_) => const LogIn()),
              );
            },
            child: const Text('logout'),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: tickets.length,
        itemBuilder: (context, index) => TicketView(ticket: tickets[index]),
      ),
    );
  }
}

class TicketView extends StatefulWidget {
  const TicketView({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.ticket.booked) {
          log('${Database.instance.ticketNumber}||${widget.ticket.seatNumber}');
          if (Database.instance.ticketNumber == widget.ticket.seatNumber) {
            // own booked
            await Database.instance.saveTicketSatus(widget.ticket.seatNumber, false);
            setState(() {
              widget.ticket.booked = false;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('The seat is already booked'),
              ),
            );
          }
        } else {
          await Database.instance.saveTicketSatus(widget.ticket.seatNumber, true);
            setState(() {
              widget.ticket.booked = true;
            });
        }
      },
      child: Card(
          color: widget.ticket.booked? Colors.amber : null,
          child: Center(
            child: Text('${widget.ticket.seatNumber}'),
          ),
        ),
    );
  }
}
