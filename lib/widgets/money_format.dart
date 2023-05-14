import 'package:money_formatter/money_formatter.dart';

String moneyFormatter(double amount) {
  MoneyFormatter fmf = MoneyFormatter(amount: amount);
  return fmf.output.nonSymbol;
}
