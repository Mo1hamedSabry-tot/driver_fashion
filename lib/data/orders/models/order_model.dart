class TOTOrderModel {
  String? rowVersion;
  String? customerId;
  String? customerName;
  String? channelId;
  String? storeId;
  String? storeName;
  String? organizationId;
  String? organizationName;
  String? employeeId;
  String? employeeName;
  String? shoppingCartId;
  bool? isPrototype;
  String? purchaseOrderNumber;
  String? subscriptionNumber;
  String? subscriptionId;
  String? objectType;
  List<dynamic>? addresses;
  List<dynamic>? inPayments;
  List<ItemModel>? items;
  List<dynamic>? shipments;
  List<dynamic>? feeDetails;
  List<dynamic>? discounts;
  double? discountAmount;
  List<dynamic>? taxDetails;
  dynamic scopes;
  double? total;
  double? subTotal;
  double? subTotalWithTax;
  double? subTotalDiscount;
  double? subTotalDiscountWithTax;
  double? subTotalTaxTotal;
  double? shippingTotal;
  double? shippingTotalWithTax;
  double? shippingSubTotal;
  double? shippingSubTotalWithTax;
  double? shippingDiscountTotal;
  double? shippingDiscountTotalWithTax;
  double? shippingTaxTotal;
  double? paymentTotal;
  double? paymentTotalWithTax;
  double? paymentSubTotal;
  double? paymentSubTotalWithTax;
  double? paymentDiscountTotal;
  double? paymentDiscountTotalWithTax;
  double? paymentTaxTotal;
  double? discountTotal;
  double? discountTotalWithTax;
  double? fee;
  double? feeWithTax;
  double? feeTotal;
  double? feeTotalWithTax;
  double? handlingTotal;
  double? handlingTotalWithTax;
  dynamic taxType;
  double? taxTotal;
  double? taxPercentRate;
  dynamic languageCode;
  String? operationType;
  dynamic parentOperationId;
  String? number;
  bool? isApproved;
  String? status;
  dynamic comment;
  String? currency;
  double sum;
  dynamic outerId;
  List<dynamic>? childrenOperations;
  String? cancelledState;
  bool? isCancelled;
  dynamic cancelledDate;
  dynamic cancelReason;
  List<dynamic>? dynamicProperties;
  dynamic operationsLog;
  String createdDate;
  String? modifiedDate;
  String? createdBy;
  String? modifiedBy;
  String id;

  TOTOrderModel({
    this.rowVersion,
    this.customerId,
    this.customerName,
    this.channelId,
    this.storeId,
    this.storeName,
    this.organizationId,
    this.organizationName,
    this.employeeId,
    this.employeeName,
    this.shoppingCartId,
    this.isPrototype,
    this.purchaseOrderNumber,
    this.subscriptionNumber,
    this.subscriptionId,
    this.objectType,
    this.addresses,
    this.inPayments,
    this.items,
    this.shipments,
    this.feeDetails,
    this.discounts,
    this.discountAmount,
    this.taxDetails,
    this.scopes,
    this.total,
    this.subTotal,
    this.subTotalWithTax,
    this.subTotalDiscount,
    this.subTotalDiscountWithTax,
    this.subTotalTaxTotal,
    this.shippingTotal,
    this.shippingTotalWithTax,
    this.shippingSubTotal,
    this.shippingSubTotalWithTax,
    this.shippingDiscountTotal,
    this.shippingDiscountTotalWithTax,
    this.shippingTaxTotal,
    this.paymentTotal,
    this.paymentTotalWithTax,
    this.paymentSubTotal,
    this.paymentSubTotalWithTax,
    this.paymentDiscountTotal,
    this.paymentDiscountTotalWithTax,
    this.paymentTaxTotal,
    this.discountTotal,
    this.discountTotalWithTax,
    this.fee,
    this.feeWithTax,
    this.feeTotal,
    this.feeTotalWithTax,
    this.handlingTotal,
    this.handlingTotalWithTax,
    this.taxType,
    this.taxTotal,
    this.taxPercentRate,
    this.languageCode,
    this.operationType,
    this.parentOperationId,
    this.number,
    this.isApproved,
    this.status,
    this.comment,
    this.currency,
    required this.sum,
    this.outerId,
    this.childrenOperations,
    this.cancelledState,
    this.isCancelled,
    this.cancelledDate,
    this.cancelReason,
    this.dynamicProperties,
    this.operationsLog,
    required this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    required this.id,
  });

  factory TOTOrderModel.fromJson(Map<String, dynamic> json) {
    return TOTOrderModel(
      rowVersion: json['rowVersion'],
      customerId: json['customerId'],
      customerName: json['customerName'],
      channelId: json['channelId'],
      storeId: json['storeId'],
      storeName: json['storeName'],
      organizationId: json['organizationId'],
      organizationName: json['organizationName'],
      employeeId: json['employeeId'],
      employeeName: json['employeeName'],
      shoppingCartId: json['shoppingCartId'],
      isPrototype: json['isPrototype'],
      purchaseOrderNumber: json['purchaseOrderNumber'],
      subscriptionNumber: json['subscriptionNumber'],
      subscriptionId: json['subscriptionId'],
      objectType: json['objectType'],
      addresses: json['addresses'] != null
          ? List<dynamic>.from(json['addresses'])
          : null,
      inPayments: json['inPayments'] != null
          ? List<dynamic>.from(json['inPayments'])
          : null,
      items: json['items'] != null
          ? List<ItemModel>.from(
              json['items'].map((x) => ItemModel.fromJson(x)))
          : null,
      shipments: json['shipments'] != null
          ? List<dynamic>.from(json['shipments'])
          : null,
      feeDetails: json['feeDetails'] != null
          ? List<dynamic>.from(json['feeDetails'])
          : null,
      discounts: json['discounts'] != null
          ? List<dynamic>.from(json['discounts'])
          : null,
      discountAmount: json['discountAmount'],
      taxDetails: json['taxDetails'] != null
          ? List<dynamic>.from(json['taxDetails'])
          : null,
      scopes: json['scopes'],
      total: json['total'],
      subTotal: json['subTotal'],
      subTotalWithTax: json['subTotalWithTax'],
      subTotalDiscount: json['subTotalDiscount'],
      subTotalDiscountWithTax: json['subTotalDiscountWithTax'],
      subTotalTaxTotal: json['subTotalTaxTotal'],
      shippingTotal: json['shippingTotal'],
      shippingTotalWithTax: json['shippingTotalWithTax'],
      shippingSubTotal: json['shippingSubTotal'],
      shippingSubTotalWithTax: json['shippingSubTotalWithTax'],
      shippingDiscountTotal: json['shippingDiscountTotal'],
      shippingDiscountTotalWithTax: json['shippingDiscountTotalWithTax'],
      shippingTaxTotal: json['shippingTaxTotal'],
      paymentTotal: json['paymentTotal'],
      paymentTotalWithTax: json['paymentTotalWithTax'],
      paymentSubTotal: json['paymentSubTotal'],
      paymentSubTotalWithTax: json['paymentSubTotalWithTax'],
      paymentDiscountTotal: json['paymentDiscountTotal'],
      paymentDiscountTotalWithTax: json['paymentDiscountTotalWithTax'],
      paymentTaxTotal: json['paymentTaxTotal'],
      discountTotal: json['discountTotal'],
      discountTotalWithTax: json['discountTotalWithTax'],
      fee: json['fee'],
      feeWithTax: json['feeWithTax'],
      feeTotal: json['feeTotal'],
      feeTotalWithTax: json['feeTotalWithTax'],
      handlingTotal: json['handlingTotal'],
      handlingTotalWithTax: json['handlingTotalWithTax'],
      taxType: json['taxType'],
      taxTotal: json['taxTotal'],
      taxPercentRate: json['taxPercentRate'],
      languageCode: json['languageCode'],
      operationType: json['operationType'],
      parentOperationId: json['parentOperationId'],
      number: json['number'],
      isApproved: json['isApproved'],
      status: json['status'],
      comment: json['comment'],
      currency: json['currency'],
      sum: json['sum'],
      outerId: json['outerId'],
      childrenOperations: json['childrenOperations'] != null
          ? List<dynamic>.from(json['childrenOperations'])
          : null,
      cancelledState: json['cancelledState'],
      isCancelled: json['isCancelled'],
      cancelledDate: json['cancelledDate'],
      cancelReason: json['cancelReason'],
      dynamicProperties: json['dynamicProperties'] != null
          ? List<dynamic>.from(json['dynamicProperties'])
          : null,
      operationsLog: json['operationsLog'],
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
      id: json['id'],
    );
  }
}

class ItemModel {
  dynamic priceId;
  String? currency;
  double? price;
  double? priceWithTax;
  double? placedPrice;
  double? placedPriceWithTax;
  double? extendedPrice;
  double? extendedPriceWithTax;
  double? discountAmount;
  double? discountAmountWithTax;
  double? discountTotal;
  double? discountTotalWithTax;
  double? fee;
  double? feeWithTax;
  dynamic taxType;
  double? taxTotal;
  double? taxPercentRate;
  int? reserveQuantity;
  int? quantity;
  String? productId;
  String? sku;
  dynamic productType;
  String? catalogId;
  dynamic categoryId;
  String? name;
  dynamic comment;
  dynamic status;
  dynamic imageUrl;
  bool? isGift;
  dynamic shippingMethodCode;
  dynamic fulfillmentLocationCode;
  dynamic fulfillmentCenterId;
  dynamic fulfillmentCenterName;
  dynamic outerId;
  List<dynamic>? feeDetails;
  dynamic vendorId;
  dynamic weightUnit;
  dynamic weight;
  dynamic measureUnit;
  dynamic height;
  dynamic length;
  dynamic width;
  bool? isCancelled;
  dynamic cancelledDate;
  dynamic cancelReason;
  String? objectType;
  List<dynamic>? dynamicProperties;
  List<dynamic>? discounts;
  List<dynamic>? taxDetails;
  String? createdDate;
  String? modifiedDate;
  String? createdBy;
  String? modifiedBy;
  String? id;

  ItemModel({
    this.priceId,
    this.currency,
    this.price,
    this.priceWithTax,
    this.placedPrice,
    this.placedPriceWithTax,
    this.extendedPrice,
    this.extendedPriceWithTax,
    this.discountAmount,
    this.discountAmountWithTax,
    this.discountTotal,
    this.discountTotalWithTax,
    this.fee,
    this.feeWithTax,
    this.taxType,
    this.taxTotal,
    this.taxPercentRate,
    this.reserveQuantity,
    this.quantity,
    this.productId,
    this.sku,
    this.productType,
    this.catalogId,
    this.categoryId,
    this.name,
    this.comment,
    this.status,
    this.imageUrl,
    this.isGift,
    this.shippingMethodCode,
    this.fulfillmentLocationCode,
    this.fulfillmentCenterId,
    this.fulfillmentCenterName,
    this.outerId,
    this.feeDetails,
    this.vendorId,
    this.weightUnit,
    this.weight,
    this.measureUnit,
    this.height,
    this.length,
    this.width,
    this.isCancelled,
    this.cancelledDate,
    this.cancelReason,
    this.objectType,
    this.dynamicProperties,
    this.discounts,
    this.taxDetails,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      priceId: json['priceId'],
      currency: json['currency'],
      price: json['price'],
      priceWithTax: json['priceWithTax'],
      placedPrice: json['placedPrice'],
      placedPriceWithTax: json['placedPriceWithTax'],
      extendedPrice: json['extendedPrice'],
      extendedPriceWithTax: json['extendedPriceWithTax'],
      discountAmount: json['discountAmount'],
      discountAmountWithTax: json['discountAmountWithTax'],
      discountTotal: json['discountTotal'],
      discountTotalWithTax: json['discountTotalWithTax'],
      fee: json['fee'],
      feeWithTax: json['feeWithTax'],
      taxType: json['taxType'],
      taxTotal: json['taxTotal'],
      taxPercentRate: json['taxPercentRate'],
      reserveQuantity: json['reserveQuantity'],
      quantity: json['quantity'],
      productId: json['productId'],
      sku: json['sku'],
      productType: json['productType'],
      catalogId: json['catalogId'],
      categoryId: json['categoryId'],
      name: json['name'],
      comment: json['comment'],
      status: json['status'],
      imageUrl: json['imageUrl'],
      isGift: json['isGift'],
      shippingMethodCode: json['shippingMethodCode'],
      fulfillmentLocationCode: json['fulfillmentLocationCode'],
      fulfillmentCenterId: json['fulfillmentCenterId'],
      fulfillmentCenterName: json['fulfillmentCenterName'],
      outerId: json['outerId'],
      feeDetails: json['feeDetails'] != null
          ? List<dynamic>.from(json['feeDetails'])
          : null,
      vendorId: json['vendorId'],
      weightUnit: json['weightUnit'],
      weight: json['weight'],
      measureUnit: json['measureUnit'],
      height: json['height'],
      length: json['length'],
      width: json['width'],
      isCancelled: json['isCancelled'],
      cancelledDate: json['cancelledDate'],
      cancelReason: json['cancelReason'],
      objectType: json['objectType'],
      dynamicProperties: json['dynamicProperties'] != null
          ? List<dynamic>.from(json['dynamicProperties'])
          : null,
      discounts: json['discounts'] != null
          ? List<dynamic>.from(json['discounts'])
          : null,
      taxDetails: json['taxDetails'] != null
          ? List<dynamic>.from(json['taxDetails'])
          : null,
      createdDate: json['createdDate'],
      modifiedDate: json['modifiedDate'],
      createdBy: json['createdBy'],
      modifiedBy: json['modifiedBy'],
      id: json['id'],
    );
  }
}
