using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.DAL.Gateway
{
    public class ViewSalesBetweenDatesGateway:BaseClassGateway
    {
       public List<ViewSalesBetweenDatesViewModel> GetAllBetweenDate(ViewSalesBetweenDatesViewModel viewSalesBetweenDatesViewModel)
        {
            string query = "SalesBetweenTwoDates";
            command = new SqlCommand(query, connection);
           
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@fromDate", viewSalesBetweenDatesViewModel.FromDate);
            command.Parameters.AddWithValue("@toDate", viewSalesBetweenDatesViewModel.ToDate);
            command.Parameters.AddWithValue("@type", viewSalesBetweenDatesViewModel.Type);
            connection.Open();
            reader = command.ExecuteReader();
            List<ViewSalesBetweenDatesViewModel> viewSalesBetweenDatesViewModelList = new List<ViewSalesBetweenDatesViewModel>();
            while (reader.Read())
            {
                viewSalesBetweenDatesViewModel = new ViewSalesBetweenDatesViewModel();

                viewSalesBetweenDatesViewModel.Quantity = Convert.ToInt32(reader["Quantity"]);
                viewSalesBetweenDatesViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                viewSalesBetweenDatesViewModel.CompanyName = reader["CompanyName"].ToString();
                viewSalesBetweenDatesViewModel.Item = reader["ItemName"].ToString();

                viewSalesBetweenDatesViewModelList.Add(viewSalesBetweenDatesViewModel);
            }
            reader.Close();
            connection.Close();
            return viewSalesBetweenDatesViewModelList;
        }

    }

               
}