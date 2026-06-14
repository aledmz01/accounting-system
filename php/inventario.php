<?php
include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
}

if($_SESSION["tipo"]=="estandar"){
    header("Location: home.php?error=acceso-denegado");
}

include("conexion.php");
?>

<!DOCTYPE html>

<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/estilos.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"/>

    <title>C.A.S | Inventario</title>
</head>

<body>

<?php include("nav.php"); ?>

<div class="container" id="contenido">

    <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">

            <div class="page-header">
                <h3>Inventario - Productos Registrados</h3>
            </div>

            <div class="row">

                <div class="col-lg-12 well">

                    <h2 class="text-primary">
                        <span class="glyphicon glyphicon-list-alt"></span>
                        Inventario del Mini Market El Ahorro
                    </h2>

                    <p class="text-info">
                        Desde este apartado puede administrar el catálogo de productos.
                        Las existencias se actualizan automáticamente mediante compras y ventas.
                    </p>

                    <a href="agregar-producto.php" class="btn btn-success">
                        <span class="glyphicon glyphicon-plus"></span>
                        Añadir Producto
                    </a>

                </div>

                <?php

                $consulta = "
SELECT *
FROM inventario
WHERE activo = 1
ORDER BY nombre
";
                $ejecutar_consulta = $conexion->query($consulta);

                $totalInventario = 0;

                ?>

                <table class="table table-hover table-condensed">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio ($)</th>
                            <th>Total ($)</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>

                    <tbody>

                    <?php

                    while($registro = $ejecutar_consulta->fetch_assoc())
                    {
                        $totalProducto = $registro['cantidad'] * $registro['precio'];
                        $totalInventario += $totalProducto;

                        echo "<tr>";

                        echo "<td>".$registro['id_inventario']."</td>";
                        echo "<td>".$registro['nombre']."</td>";
                        echo "<td>".$registro['cantidad']."</td>";
                        echo "<td>".number_format($registro['precio'],2)."</td>";
                        echo "<td>".number_format($totalProducto,2)."</td>";

                        echo "<td>";

                        echo "
                        <a
                            href='editar-producto.php?id=".$registro['id_inventario']."'
                            class='btn btn-warning btn-xs'
                        >
                            <span class='glyphicon glyphicon-pencil'></span>
                            Editar
                        </a>
                        ";

                        echo " ";

                        if($registro['cantidad'] == 0){

                            echo "
                            <a
                                href='eliminar-producto.php?id=".$registro['id_inventario']."'
                                class='btn btn-danger btn-xs'
                                onclick=\"return confirm('¿Desea eliminar este producto?');\"
                            >
                                <span class='glyphicon glyphicon-trash'></span>
                                Eliminar
                            </a>
                            ";

                        }else{

                            echo "
                            <button
                                class='btn btn-default btn-xs'
                                disabled
                            >
                                En inventario
                            </button>
                            ";

                        }

                        echo "</td>";

                        echo "</tr>";
                    }

                    ?>

                    </tbody>

                    <tfoot>
                        <tr class="success">
                            <th colspan="4" style="text-align:right">
                                Valor Total del Inventario:
                            </th>
                            <th>
                                $ <?php echo number_format($totalInventario,2); ?>
                            </th>
                            <th></th>
                        </tr>
                    </tfoot>

                </table>

            </div>

        </div>

        <?php include("sidebar.php"); ?>

    </div>

</div>

<?php include("footer.php"); ?>

<?php include("modal.php"); ?>

<script src="../js/bootstrap.min.js"></script>

</body>
</html>