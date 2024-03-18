import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/constants/gaps.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anon"),
        centerTitle: true,
        actions: const [
          FaIcon(
            FontAwesomeIcons.clock,
          ),
          Gaps.h5,
        ],
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              CircleAvatar(
                child: Text("상민"),
              ),
              Gaps.v5,
              Text("@Anon"),
              Gaps.v10,
              Text(
                "https://nomadcoders.co",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
