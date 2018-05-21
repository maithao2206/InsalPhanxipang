$("#category").on("change", function() {
  var category_id = $("#category option:selected").val();
  var url_path = "/admin/products#index";
  $.ajax({
    url: url_path,
    type: "GET",
    dataType: "script",
    data: {
      "category_id": category_id
    },
  });
})
$("#show").on("click", ".bt-delete", function() {
  var product_id = $(this).attr("id-button");
  var url = "/admin/products/" + product_id;
  var nameproduct = $("[id-name =" + product_id + "]").text();
  var category_id = $("#category option:selected").val();
  var a = bootbox.confirm({
    title: "Xác nhận xóa",
    message: "Bạn có muốn xóa sản phẩm " + nameproduct + " này không?",
    buttons: {
      cancel: {
        label: '<i class="fa fa-times"></i> không'
      },
      confirm: {
        label: '<i class="fa fa-check"></i> có'
      }
    },
    callback: function(result) {
      if (result) {
        $.ajax({
          url: url,
          type: "DELETE",
          dataType: "script",
          data: {
            "product_id": product_id,
            "category_id": category_id

          },
        });
      }
    }
  });
  a.find('.modal-content').addClass("modal-confirm");
  a.find('.modal-header').addClass("custom-header");
  a.find('.modal-footer').addClass("custom-footer");
  a.find('.bootbox-body').addClass("custom-body");
})

$(".new_product").validate({
  errorPlacement: function(error, element) {
    error.insertAfter(element);
  },
  rules: {
    "product[image]": {
      required: true,
    },
    "product[name]": {
      required: true,
    },
    "product[price]": {
      required: true,
      number: true,
      min: 0,
    },
    "product[renting_fee]": {
      required: true,
      number: true,
      min: 0,
    }
  },
  messages: {
    "product[image]": {
      required: "xin chọn ảnh",
    },
    "product[name]": {
      required: "tên không hợp lệ!",
    },
    "product[price]": {
      required: "giá không hợp lệ",
      number: "phải là số",
      min: "không được âm",
    },
    "product[renting_fee]": {
      required: "phí thuê không hợp lệ",
      number: "phải là số",
      min: "không được âm",
    }
  },
  onfocusout: function(element) {
      this.element(element);
    }
})
