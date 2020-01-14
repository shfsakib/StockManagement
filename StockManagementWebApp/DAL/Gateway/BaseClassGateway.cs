using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace StockManagementWebApp.DAL.Gateway
{
    public class BaseClassGateway
    {
         public SqlConnection connection;
         public SqlCommand command;
         public SqlDataReader reader;
         public SqlDataAdapter adapter;
        private DataTable dataTable;
        public BaseClassGateway()
        {
            string conString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;
            connection = new SqlConnection(conString);

        }
    }
}