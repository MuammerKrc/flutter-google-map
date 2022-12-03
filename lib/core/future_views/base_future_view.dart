import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/management_enum.dart';
import '../managements/base_management.dart';

class GetFutureView<TManagement extends BaseManagement>
    extends StatelessWidget {
  Widget bodywidget;
  GetFutureView(this.bodywidget, {super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<TManagement>().response == ManagementResponse.Loading
        ? const Center(child: CircularProgressIndicator())
        : (context.read<TManagement>().response ==
                ManagementResponse.ErrorResponse
            ? const Center(child: Text("Bir hata Meydana geldi"))
            : bodywidget);
  }
}
