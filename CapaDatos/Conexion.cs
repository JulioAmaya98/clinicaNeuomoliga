﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.CompilerServices;

namespace CapaDatos
{
    public class Conexion
    {
        SqlConnection conn = new SqlConnection("Data Source=JULIO\\SQLEXPRESS;Initial Catalog=clinic;Integrated Security=True");

       
        public SqlConnection abrirConexion()
        {
            if (conn.State == ConnectionState.Closed)
                conn.Open();
            return conn;
        }
        public SqlConnection cerrarConexion()
        {

            if (conn.State == ConnectionState.Open)
                conn.Close();
            return conn;
        }
    }
}
