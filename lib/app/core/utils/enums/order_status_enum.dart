enum OrderStatus {
  available,
  picked,
  readyToDeliver,
  completed;

  @override
  String toString() {
    return switch (this) {
      OrderStatus.available => "Ready",
      OrderStatus.picked => "Picked",
      OrderStatus.readyToDeliver => "ReadyToDeliver",
      OrderStatus.completed => "Completed",
    };
  }
}
