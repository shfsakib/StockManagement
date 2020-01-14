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
    public class StockOutGateway : BaseClassGateway
    {
        StockOutViewModel stockOutViewModel = new StockOutViewModel();

        public List<StockOutViewModel> GetAllCompanyFromStock(StockOutViewModel stockOutViewModel)
        {

            string query = "CompanyByIdProcedure";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<StockOutViewModel> itemModelCompanyViewList = new List<StockOutViewModel>();
            while (reader.Read())
            {
               stockOutViewModel = new StockOutViewModel();
                stockOutViewModel.CompanySl = Convert.ToInt32(reader["CompanyId"]);
                stockOutViewModel.CompanyName = reader["CompanyName"].ToString();
                itemModelCompanyViewList.Add(stockOutViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelCompanyViewList;
        }
        public List<StockOutViewModel> GetAllItemByCompany(StockOutViewModel stockOutViewModel)
        {
            stockOutViewModel.Type = "Buy";
            string query = "GETALLITEMBYCOMPANY";
            command = new SqlCommand(query, connection);
             command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@company", stockOutViewModel.CompanySl);
            connection.Open();
            reader = command.ExecuteReader();
            List<StockOutViewModel> stockOutModelList = new List<StockOutViewModel>();
            while (reader.Read())
            {
                stockOutViewModel = new StockOutViewModel();

                stockOutViewModel.ItemSl = Convert.ToInt32(reader["ItemSl"]);
                stockOutViewModel.ItemName = reader["ItemName"].ToString();

                stockOutModelList.Add(stockOutViewModel);
            }
            reader.Close();
            connection.Close();
            return stockOutModelList;
        }
        public StockOutViewModel GetReorderByItem(StockOutViewModel stockOutViewModel)
        {

            string query = "GETREORDERBYITEMCOMPANY";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockOutViewModel.ItemSl);
            command.Parameters.AddWithValue("@company", stockOutViewModel.CompanySl);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            stockOutViewModel = null;

            if (reader.HasRows)
            {
                stockOutViewModel = new StockOutViewModel();
                stockOutViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);

            }
            reader.Close();
            connection.Close();

            return stockOutViewModel;
        }
        public StockOutViewModel GetQuantityByItem(StockOutViewModel stockOutViewModel)
        {

            string query = "TotalStock";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockOutViewModel.ItemName);

            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            stockOutViewModel = null;

            if (reader.HasRows)
            {
                stockOutViewModel = new StockOutViewModel();
                stockOutViewModel.Quantity = Convert.ToInt32(reader["Quantity"]);

            }
            reader.Close();
            connection.Close();

            return stockOutViewModel;
        }

        public int SaveAllSaleRowFromGrid(StockOutModel stockOutModel)
        {
            string query = "INSERTALLROWFORSALEDAMAGELOSS";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockOutModel.ItemSl);
            command.Parameters.AddWithValue("@quantity", stockOutModel.Quantity);
            command.Parameters.AddWithValue("@type", stockOutModel.Type);
            command.Parameters.AddWithValue("@inTime", stockOutModel.InTime);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        public int SaveAllDamageRowFromGrid(StockOutModel stockOutModel)
        {
            string query = "INSERTALLROWFORSALEDAMAGELOSS";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockOutModel.ItemSl);
            command.Parameters.AddWithValue("@quantity", stockOutModel.Quantity);
            command.Parameters.AddWithValue("@type", stockOutModel.Type);
            command.Parameters.AddWithValue("@inTime", stockOutModel.InTime);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        public int SaveAllLossRowFromGrid(StockOutModel stockOutModel)
        {
            string query = "INSERTALLROWFORSALEDAMAGELOSS";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockOutModel.ItemSl);
            command.Parameters.AddWithValue("@quantity", stockOutModel.Quantity);
            command.Parameters.AddWithValue("@type", stockOutModel.Type);
            command.Parameters.AddWithValue("@inTime", stockOutModel.InTime);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
    }
}