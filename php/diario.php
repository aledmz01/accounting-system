<?php 
include("funciones.php"); 
include("sesion.php");

if(!isset($_COOKIE["sesion"])){
    header("Location: salir.php");
    exit;
}

include("conexion.php");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/estilos.css"/>
    <title>C.A.S | Libro Diario</title>
</head>

<body>

<?php include("nav.php"); ?>

<div class="container" id="contenido">

<div class="row">

    <div class="col-xs-12 col-sm-9">

        <div class="page-header">
            <h3>Libro Diario General</h3>
        </div>

        <!-- MENSAJES -->
        <?php if(isset($_GET["mensaje"])) { ?>
            <div class="alert alert-info">
                <?php echo $_GET["mensaje"]; ?>
            </div>
        <?php } ?>

        <div class="well">
            <h4 class="text-primary">Movimientos contables</h4>
            <p class="text-info">
                Se muestran los asientos registrados en el sistema.
            </p>
        </div>

        <?php
        if(!isset($conexion)){
            include("conexion.php");
        }

        /*
        🔥 IMPORTANTE:
        Usamos TU estructura real:
        - transaccion = 1,2,3...
        - tipo = 1 o 2
        */

        $sql = "
            SELECT *
            FROM registro
            ORDER BY transaccion ASC, id ASC
        ";

        $resultado = $conexion->query($sql);

        if($resultado->num_rows > 0){

            $actual = null;

            while($row = $resultado->fetch_assoc()){

                // 👉 Detectar cambio de asiento
                if($actual != $row["transaccion"]){

                    if($actual != null){
                        echo "</tbody></table><br>";
                    }

                    $actual = $row["transaccion"];

                    echo "<div class='alert alert-success'>";
                    echo "<strong>Asiento: </strong> " . $actual;
                    echo "</div>";

                    echo "<table class='table table-bordered table-hover'>";
                    echo "<thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Cuenta</th>
                                <th>Concepto</th>
                                <th class='text-right'>Debe</th>
                                <th class='text-right'>Haber</th>
                            </tr>
                          </thead>
                          <tbody>";
                }

                echo "<tr>";
                echo "<td>".$row['fecha']."</td>";
                echo "<td>".$row['cuenta']."</td>";
                echo "<td>".$row['concepto']."</td>";
                echo "<td class='text-right'>".number_format($row['debe'],2)."</td>";
                echo "<td class='text-right'>".number_format($row['haber'],2)."</td>";
                echo "</tr>";
            }

            echo "</tbody></table>";

            // 🔥 TOTALES
            $tot = $conexion->query("
                SELECT 
                    SUM(debe) AS debe,
                    SUM(haber) AS haber
                FROM registro
            ")->fetch_assoc();

            $dif = $tot["debe"] - $tot["haber"];

            echo "<hr>";
            echo "<table class='table table-bordered'>";
            echo "<tr>";
            echo "<td class='text-right'><strong>TOTALES</strong></td>";
            echo "<td class='text-right'><strong>$ ".number_format($tot["debe"],2)."</strong></td>";
            echo "<td class='text-right'><strong>$ ".number_format($tot["haber"],2)."</strong></td>";

            if($dif != 0){
                echo "<td class='danger text-right'><strong>DIF: $ ".number_format($dif,2)."</strong></td>";
            } else {
                echo "<td></td>";
            }

            echo "</tr>";
            echo "</table>";

        } else {
            echo "<div class='alert alert-info'>No hay movimientos registrados.</div>";
        }
        ?>

    </div>

    <?php include("sidebar.php"); ?>

</div>

</div>

<?php include("footer.php"); ?>a
<?php include("modal.php"); ?>

<script src="../js/bootstrap.min.js"></script>

</body>
</html>