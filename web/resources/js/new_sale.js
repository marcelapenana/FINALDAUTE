var products = [],
        sale = [],
        i = 0,
        total = 0,
        method = 1,
        customer = "";

jQuery(() => {
    document.title = "Nueva venta";
    
    if (sessionStorage.cart) {
        products = JSON.parse(sessionStorage.cart);
        sale = JSON.parse(sessionStorage.sale);
        let table = "";
        products.map((cart) => {
            table += `<tr class="tr">
                        <td>${cart.code}</td>
                        <td>${cart.name}</td>
                        <td>${cart.price}</td>
                        <td>${cart.qty}</td>
                        <td>${cart.subTotalProd}</td>
                        <td><button id="btnRemove" onClick="deleteProductCart(${i})" 
                            class="btn btn-sm btn-danger"><i class="bi-trash3"> 
                            <span> Quitar</span></i></button></td>
                    </tr>`;
            i++;
        });
        $("#items").text(sale.items);
        $("#subTotal").text(sale.subTotal);
        $("#total").text(sale.total);
        $("#cart").append(table);
        items = sale.items;
        subTotal = sale.subTotal;
        total = sale.total;
    }
});

$("#searchCar-form").submit((e) => {
    e.preventDefault();
    let code = $("#txtCode").val();
    let qty = $("#qty").val();
    if (code === "")
        return;
    
    $.ajax({
        url: `NewSaleController?carCode=${code}`,
        method: "GET",
        success: (res) => {
            console.log(res);
            res = JSON.parse(res);
            try {
                qty = parseInt(qty);
                let subTotalProd = res.price * qty;
                let productCart = res;
                productCart.qty = qty;
                productCart.subTotalProd = subTotalProd;
                productCart.isRemoved = 0;
                products.push(productCart);
                items += qty;
                subTotal += subTotalProd;
                total = subTotal;
                let table = `<tr class="tr">
                                                <td>${code}</td>
                                                <td>${productCart.name}</td>
                                                <td>${productCart.price}</td>
                                                <td>${productCart.qty}</td>
                                                <td>${productCart.subTotalProd}</td>
                                                <td><button id="btnRemove" onClick="deleteProductCart(${i})" class="btn btn-sm btn-danger"><i class="bi-trash3"> <span> Quitar</span></i></button></td>
                                            </tr>`;
                $("#items").text(items);
                $("#subTotal").text(subTotal);
                $("#total").text(total);
                i++;
                $("#cart").append(table);
                $("#txtCode").val("");
                $("#qty").val(1);
                sale = {items, subTotal, total};
                sessionStorage.cart = JSON.stringify(products);
                sessionStorage.sale = JSON.stringify(sale);
            } catch (e) {
                showErrorAlert("Auto no Disponible o código mal escrito");
            }
        },
        error: (err) => {
            alert("Error: " + err);
        },
    });
});

const deleteProductCart = (j) => {
    items -= products[j].qty;
    subTotal -= products[j].subTotalProd;
    total -= products[j].subTotalProd;
    products[j].isRemoved = 1;
    $("#items").text(items);
    $("#subTotal").text(subTotal);
    $("#total").text(total);
    $("body").on("click", "#btnRemove", function () {
        $(this).closest("tr").remove();
    });
};

const cancelSale = () => {
    if (products.length < 1)
        return;
    showConfirmationAlert("¿Estás seguro de cancelar esta venta?")
            .then((res) => {
                    if (res.isConfirmed) {
                        cleanDisplay();
                    }
            }
    );
};

const cleanDisplay = () => {
    products = [];
    sale = [];
    $("#txtCode").val("");
    $("#qty").val(1);
    $(".tr").remove();
    sessionStorage.clear();
};

const newSale = () => {
    if (products.length > 0) {
        showConfirmationAlert(
                "Hay una orden en proceso, ¿estás seguro de iniciar otra?"
                ).then((res) => {
            if (res.isConfirmed)
                return;
        });
    }

    cleanLabels();
    cleanDisplay();
};

const cleanLabels = () => {
    items = 0;
    subTotal = 0;
    total = 0;
    i = 0;
    $("#items").text(items);
    $("#subTotal").text(subTotal);
    $("#total").text(total);
};

$("#btnSearchCustomer").click(() => {
    let dui = $("#dui").val();
    if (dui === "")
        return;

    $.ajax({
        url: `NewSaleController?clientCode=${dui}`,
        method: "GET",
        success: res => {
            console.log(res);
            if (res.length > 9) {
                customer = res;
                
            } else
                showErrorAlert(
                        "No se encontró ningún cliente con ese número de dui");
        }
    });
});

$("#myForm").submit((e) => {
    e.preventDefault();
    if (products.length < 1)
        return;
    method = $("#cmbMethod").val();
    saveSale();
});

const saveSale = () => {
    $.ajax({
        url: $("#myForm").attr("action"),
        method: $("#myForm").attr("method"),
        data: {
            cart: products,
            sale: {
                items,
                subTotal,
                total,
                method,
                customer,
            },
        },
        success: (res) => {
            res = JSON.parse(res);
            if (res[1] > 0) {
                showSuccessAlert("Venta Realizada con éxito");
                cleanDisplay();
            } else
                showErrorAlert("Error al realizar la venta");
        },
    });
};
