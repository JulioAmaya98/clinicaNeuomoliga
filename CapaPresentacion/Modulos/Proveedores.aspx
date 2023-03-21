﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="CapaPresentacion.Modulos.Proveedores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="../css/StyleInicio.css" rel="stylesheet" />
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="../css/StyleLProveedores.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div>
            <form id="form1" runat="server">
    <div class="container mt-3">
        <ul class="nav nav-tabs justify-content-end " role="tablist">
            <li class="nav-item">
                <a class="nav-link " id="navInicio" href="#">Inicio</a>
            </li>
            <li class="nav-item">
                <a runat="server" id="navProductos" class="nav-link " data-bs-toggle="tab" href="#">Productos</a>
            </li>
            <li class="nav-item">
                        <a class="nav-link active " runat="server" id="navProveedores" href="#">Proveedores</a>
                    </li>
            <li class="nav-item">
                <a runat="server" id="navEmpleados" class="nav-link  " href="#">Empleados</a>
                </li>
                 
            <li class="nav-item">
                <a class="nav-link  " runat="server" id="navInventario" href="#">Inventario</a>
            </li>
                        <li class="nav-item">
                <asp:Button ID="Cerrar" runat="server" CssClass="btn btn-danger" Text="Cerrar Session" OnClick="Cerrar_Click" />
            </li>
        </ul>
    </div>
    <div class="container">
        <div class="row">
                    <div class="ALL">
                    <div  id="conten">
                        <div id="encabezado">
                            <nav class="navbar navbar-expand-lg">
                                <h4>Proveedores</h4>
                                <div class="container-fluid">
                                    <asp:Button ID="Button1" runat="server" Text="Agregar" CssClass="btn btn-outline-success botoRedondo " />
                                </div>
                                <div class="container-fluid">
                                    <form class="d-flex" role="search">

                                        <input id="myInput" style="margin-right: 1%" class="form-control " placeholder="Search" aria-label="Search">
                                    </form>
                                </div>
                            </nav>
                        </div>
                        <asp:GridView OnPageIndexChanging="gridProveedores_PageIndexChanging" AllowPaging="false" ID="gridProveedores" runat="server" CssClass="table table-hover  myGridView" HorizontalAlign="Justify" OnSelectIndexChanged="gridProveedores_SelectedIndexChanged">
                            <PagerSettings Mode="NumericFirstLast" Position="Bottom" /> 
                            <Columns>
                                <asp:TemplateField  ItemStyle-CssClass="ancho" HeaderText="Opciones">
                                    <ItemTemplate>
                                        <asp:Button  ID="ButtonEditar" runat="server" Text="Editar" CssClass="btn btn-outline-warning" /> 
                                        <asp:Button ID="ButtonEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>     
                    </div>
                </div>
    </div>
   </div>
            </form>
        </div>
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#gridProveedores tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
     <script>

         var rol = window.location.search.substring(1);
         rol = rol.split("rol=")[1];

         if (rol == "TQBlAGQAaQBjAG8A") {

             const empleados = document.getElementById('navEmpleados');
             empleados.setAttribute('href', 'Empleados.aspx?rol=' + rol);
             const proveedores = document.getElementById('navProveedores');
             proveedores.setAttribute('href', 'Proveedores.aspx?rol=' + rol);
             const inventario = document.getElementById('navInventario');
             inventario.setAttribute('href', '../Bodeguero/Inventario.aspx?rol=' + rol);
             const productos = document.getElementById('navProductos');
             productos.setAttribute('href', 'producto.aspx?rol=' + rol);
             const inicio = document.getElementById('navInicio');
             inicio.setAttribute('href', 'Inicio.aspx?rol=' + rol);
         } else if (rol == "UwBlAGMAcgBlAHQAYQByAGkAYQA=") {
             const proveedores = document.getElementById('navProveedores');
             proveedores.setAttribute('href', 'Proveedores.aspx?rol=' + rol);
             const productos = document.getElementById('navProductos');
             productos.setAttribute('href', 'producto.aspx?rol=' + rol);
             const inicio = document.getElementById('navInicio');
             inicio.setAttribute('href', 'Inicio.aspx?rol=' + rol);
         }

     </script>
</body>
</html>
