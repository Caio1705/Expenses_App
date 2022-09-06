import 'package:flutter/material.dart';
import 'package:flutter_despesas_pessoais/main.dart';
import 'package:flutter_despesas_pessoais/models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.onRemove,
  });
  final List<TransactionModel> transactions;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'lib/assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final tr = transactions[index];
                return Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(bottomSheetBorderRadius),
                    ),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                              'R\$${tr.value}',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          onRemove(tr.id);
                        },
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
