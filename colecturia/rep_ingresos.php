<?php
	require_once("../php/fpdf17/fpdf.php");

	class ReportePDf extends FPDF{

		function Header(){

			// Dibujar las imagenes
			$this->Image("../img/logoes.jpg", 20, 10, 20); // Logo de El Salvador
			$this->Image("../img/logoal.jpg", 170, 10, 25); // Logo de la alcaldia

			//Dibujar la tres lineas de texto
			$this->SetFont("Arial", "B", 14); 
			$this->Cell(0, 6, "REGISTRO DEL ESTADO FAMILIAR", 0, 1, "C");

			$this->SetFont("Arial", "", 16);
			$this->SetTextColor(0,102,154);
			$this->Cell(0, 6, utf8_decode("ALCALDIA MUNICIPAL VILLA SAN CRISTÓBAL"), 0, 1, "C");

			$this->SetFont("Arial", "", 8);
			$this->SetTextColor(0, 0, 0);
			$this->Cell(0, 4, utf8_decode("DEPARTAMENTO DE CUSCATLÁN, TEL.: 2379-7131"), 0, 0, "C");

			// Dibujar las dos Lineas
			$this->SetLineWidth(0.5); // Establecer el grosor de las lineas a 0.5 milimetros
			$this->SetDrawColor(0,0,255); // Establecer el color de la primer linea a azul
			$this->Line(45,26,165,26); // Dibujar la primer linea
			//$this->SetDrawColor(255,0,0); // Establecer el color de la segunda linea a rojo
			$this->Line(45,28,165,28); // Dibujar la segunda linea
		}
	}

	$reporte = new ReportePDF("P", "mm", "letter");
	$reporte->SetMargins(20,10);
	$reporte->AddPage();
	$reporte->SetFont("Arial", "", "12");
	//$reporte->SetMargins(20,10);

	// Encabezado de la tabla
	$reporte->SetY(40);
	$reporte->Cell(25, 8, utf8_decode("Código"), 1, 0, "C");
	$reporte->Cell(125, 8, "Concepto", 1, 0, "C");
	$reporte->Cell(25, 8, "Total", 1, 1, "C");

	// Datos de la tabla:
	for ($i=1; $i < 25 ; $i++) { 
		$reporte->Cell(25, 8, $i, 1, 0, "C");
		$reporte->Cell(125, 8, utf8_decode("Concepto No. " . $i), 1, 0 , "L");
		$reporte->Cell(25, 8, "$ 2.00", 1, 1, "$ " . $i);
	}

	$reporte->Output();
?>