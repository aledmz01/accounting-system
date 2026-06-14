<?php
include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
    exit;
}

include("conexion.php");

$productos = $conexion->query("
SELECT *
FROM inventario
ORDER BY nombre
");
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/estilos.css">

<title>Registrar Compra</title>
</head>

<body>

<?php include("nav.php"); ?>

<div class="container" id="contenido">

<div class="row row-offcanvas row-offcanvas-right">

    <div class="col-xs-12 col-sm-9">
        <div class="row">

<div class="page-header">
    <h3>Registrar Venta</h3>
</div>

<?php

$mensaje = $_GET["mensaje"] ?? "";
$error = $_GET["error"] ?? "";

if($error == "si"){
    echo "<div class='alert alert-danger'>$mensaje</div>";
}

if($error == "no"){
    echo "<div class='alert alert-success'>$mensaje</div>";
}
?>

<form action="guardar-compra.php" method="POST">

<div class="row">

    <div class="col-md-6">
        <label>Concepto</label>

        <input
            type="text"
            name="concepto_txt"
            class="form-control"
            value="Compra de mercadería"
            required
        >
    </div>

    <div class="col-md-3">

        <label>Tipo de pago</label>

        <select
            name="tipo_pago_slc"
            class="form-control"
            required
        >
            <option value="CONTADO">CONTADO</option>
            <option value="CREDITO">CRÉDITO</option>
        </select>

    </div>

</div>

<hr>

<button
    type="button"
    class="btn btn-primary"
    id="agregarProducto"
>
    Agregar producto
</button>

<br><br>

<table class="table table-bordered" id="tablaProductos">

    <thead>

        <tr>
            <th width="40%">Producto</th>
            <th width="15%">Cantidad</th>
            <th width="15%">Costo Unitario</th>
            <th width="20%">Subtotal</th>
            <th width="10%">Acción</th>
        </tr>

    </thead>

    <tbody>

    </tbody>

</table>

<div class="alert alert-info">

    <h4>
        Total Compra:
        $ <span id="totalGeneral">0.00</span>
    </h4>

</div>

<input
    type="hidden"
    name="total_hdn"
    id="total_hdn"
>

<button
    type="submit"
    class="btn btn-success"
>
    Registrar Compra
</button>

</form>

</div> <!-- row -->
</div> <!-- col-sm-9 -->

<?php include("sidebar.php"); ?>

</div> <!-- row row-offcanvas -->

</div> <!-- container -->

<?php include("footer.php"); ?>
<?php include("modal.php"); ?>


<script>

let productos = `
<?php

$productos->data_seek(0);

while($p = $productos->fetch_assoc()){

echo "<option
value='{$p["id_inventario"]}'
data-costo='{$p["costo"]}'
>
{$p["nombre"]}
</option>";

}
?>
`;

let tbody = document.querySelector("#tablaProductos tbody");

document
.getElementById("agregarProducto")
.addEventListener("click", agregarFila);

function agregarFila(){

let fila = document.createElement("tr");

fila.innerHTML = `

<td>

<select
name="producto[]"
class="form-control producto"
required
>

<option value="">
Seleccione
</option>

${productos}

</select>

</td>

<td>

<input
type="number"
name="cantidad[]"
class="form-control cantidad"
min="1"
value="1"
required
>

</td>

<td>

<input
type="number"
step="0.01"
min="0.01"
name="costo[]"
class="form-control costo"
value="0.00"
required
>

</td>

<td>

<input
type="text"
class="form-control subtotal"
readonly
value="0.00"
>

</td>

<td>

<button
type="button"
class="btn btn-danger eliminar"
>
X
</button>

</td>

`;

tbody.appendChild(fila);

eventosFila(fila);
}

function eventosFila(fila){

let producto = fila.querySelector(".producto");
let cantidad = fila.querySelector(".cantidad");
let costo = fila.querySelector(".costo");

producto.addEventListener("change", () => {

let seleccionado =
producto.options[producto.selectedIndex];

let costoProducto =
parseFloat(
seleccionado.dataset.costo || 0
);

costo.value = costoProducto.toFixed(2);

calcularFila(fila);

});

cantidad.addEventListener("input", () => {
calcularFila(fila);
});

costo.addEventListener("input", () => {
calcularFila(fila);
});

fila.querySelector(".eliminar")
.addEventListener("click", () => {

fila.remove();

calcularTotal();

});

}

function calcularFila(fila){

let cantidad = parseFloat(
fila.querySelector(".cantidad").value || 0
);

let costo = parseFloat(
fila.querySelector(".costo").value || 0
);

let subtotal = cantidad * costo;

fila.querySelector(".subtotal").value =
subtotal.toFixed(2);

calcularTotal();

}

function calcularTotal(){

let total = 0;

document
.querySelectorAll(".subtotal")
.forEach(campo => {

total += parseFloat(campo.value || 0);

});

document.getElementById("totalGeneral")
.innerText = total.toFixed(2);

document.getElementById("total_hdn")
.value = total.toFixed(2);

}

agregarFila();

</script>

<script src="../js/bootstrap.min.js"></script>

</body>
</html>