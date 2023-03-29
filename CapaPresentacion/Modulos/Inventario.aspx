﻿<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="CapaPresentacion.ProductosBodega" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="../css/StyleLProducto.css" rel="stylesheet" />
    <script src="../JS/Roles.js"></script>
    <script src="../JS/sweetalert2.all.min.js"></script>
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
                        <a class="nav-link" runat="server" id="navProductos" href="#">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" runat="server" data-bs-toggle="tab" id="navProveedores" href="#">Proveedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" runat="server" data-bs-toggle="tab" id="navEmpleados" href="#">Empleados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active " id="navInventario" href="#">Inventario</a>
                    </li>
                    <li class="nav-item">
                        <asp:Button ID="Cerrar" runat="server" CssClass="btn btn-danger" Text="Cerrar Session" OnClick="Cerrar_Click" />
                    </li>
                </ul>
            </div>
            <div class="container">
                <div class="row">
                    <div class="ALL">
                        <div id="conten">
                            <div id="encabezado">
                                <nav class="navbar navbar-expand-lg">
                                    <h4>Inventario</h4>
                                    <div class="container-fluid">
                                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-outline-success botoRedondo " OnClick="btnAgregar_Click" />
                                    </div>
                                    <div class="container-fluid">
                                        <form class="d-flex" role="search">

                                            <input id="myInput" style="margin-right: 1%" class="form-control " placeholder="Search" aria-label="Search">
                                        </form>
                                    </div>
                                </nav>
                            </div>
                            <asp:GridView OnPageIndexChanging="gridProducto_PageIndexChanging" AutoGenerateColumns="false" DataKeyNames="id_inventario" DataSourceID="SqlDataSourceInventario"
                                OnRowDataBound="gridProducto_RowDataBound" AllowPaging="false" ID="gridProducto" runat="server" CssClass="table table-hover  myGridView" HorizontalAlign="Justify">
                                <PagerSettings Mode="NumericFirstLast" Position="Bottom" />
                                <Columns>

                                    <asp:BoundField DataField="id_inventario" HeaderText="id_inventario" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="id_inventario" />
                                    <asp:BoundField DataField="Codigo del producto" HeaderText="Codigo del producto" SortExpression="Codigo del producto" />
                                    <asp:BoundField DataField="Proveedor" HeaderText="Proveedor" SortExpression="Proveedor" />

                                    <asp:BoundField DataField="cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                                    <asp:BoundField DataField="lote" HeaderText="Lote" SortExpression="lote" />
                                    <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
                                    <asp:BoundField DataField="fecha_vencimiento" HeaderText="Fecha de Vencimiento" SortExpression="fecha_vencimiento" />
                                    <asp:BoundField DataField="fecha_entrada" HeaderText="Fecha de entrada" SortExpression="fecha_entrada" />

                                    <asp:TemplateField ItemStyle-CssClass="ancho" HeaderText="Opciones">
                                        <ItemTemplate>
                                            <button type="button" class="btn btn-outline-warning" onclick="editarInventario(<%#Eval("id_inventario") %>)">
                                                <span>Editar</span>
                                            </button>
                                            <button type="button" class="btn btn-outline-danger" onclick="eliminarInventario(<%#Eval("id_inventario") %>)">
                                                <span>Eliminar</span>
                                            </button>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSourceInventario" runat="server" ConnectionString="<%$ ConnectionStrings:clinicConnectionString2 %>" SelectCommand="sp_mostrar_productos_inventario" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

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
                $("#gridProducto tbody tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <script>
        var rol = window.location.search.substring(1);
        rol = rol.split("rol=")[1];

        function editarInventario(idProveedor) {
            window.location.href = 'EditarInventario.aspx?id_inventario=' + idProveedor + "&rol=" + rol
        }



        const eliminarInventario = (idProveedor) => {
            Swal.fire({
                title: 'Quieres borrar este Producto?',
                text: "Una vez borrado no podras recurperarla",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, eliminar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    setTimeout(() => {
                        location.href = "Inventario.aspx?rol=" + rol + "&id=" + idProveedor
                    }, 500);
                }
            })
        }
    </script>
</body>
</html>
