/*
Задача 3.
Реализация статусов заказа:
Создайте Enum для статусов заказа в интернет-магазине: NEW, IN_PROGRESS, DELIVERED,
CANCELLED. Реализуйте класс Order, который будет хранить информацию о заказе и текущем
статусе, а также методы для смены статуса.

Требования:

Определите Enum для статусов заказа.
Реализуйте методы в классе Order для изменения и отображения статуса заказа.
Реализуйте логику проверки переходов статусов, чтобы нельзя было отменить доставленный заказ.
*/
enum OrderStatus { NEW, IN_PROGRESS, DELIVERED, CANCELLED }

class Order {
  final int id;
  OrderStatus _status;

  Order(this.id, this._status);

  void changeStatus(OrderStatus newStatus) {
    if (_status == OrderStatus.DELIVERED && newStatus == OrderStatus.CANCELLED) {
      print("Ошибка: доставленный заказ нельзя отменить!");
      return;
    }
    _status = newStatus;
    print("Статус заказа №$id изменён на $_status");
  }

  void showStatus() {
    print("Текущий статус заказа №$id: $_status");
  }
}

void main() {
  var order = Order(101, OrderStatus.NEW);

  order.showStatus();
  order.changeStatus(OrderStatus.IN_PROGRESS);
  order.changeStatus(OrderStatus.DELIVERED);
  order.changeStatus(OrderStatus.CANCELLED);

  order.showStatus();
}