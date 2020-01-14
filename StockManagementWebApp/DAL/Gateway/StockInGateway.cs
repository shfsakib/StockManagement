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
    public class StockInGateway:BaseClassGateway
    {
        StockInViewModel stockInViewModel=new StockInViewModel();
        public List<StockInViewModel> GetAllItemCompany()
        {

            string query = "SELECT * FROM CompanyInfo";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<StockInViewModel> itemModelCompanyViewList = new List<StockInViewModel>();
            while (reader.Read())
            {
                StockInViewModel stockInViewModel = new StockInViewModel();
                stockInViewModel.CompanyId = Convert.ToInt32(reader["Sl"]);
                stockInViewModel.CompanyName = reader["CompanyName"].ToString();
                itemModelCompanyViewList.Add(stockInViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelCompanyViewList;
        }
        public List<StockInViewModel> GetAllItemByCompany(StockInViewModel stockInViewModel )
        {
            string query = "SELECT * FROM ItemSetup WHERE CompanyId='"+stockInViewModel.CompanyId+"'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<StockInViewModel> StockInModelViewList = new List<StockInViewModel>();
            while (reader.Read())
            {
              stockInViewModel = new StockInViewModel();

               stockInViewModel.ItemName = reader["ItemName"].ToString();
               stockInViewModel.ItemSl = Convert.ToInt32(reader["Sl"]);

               StockInModelViewList.Add(stockInViewModel);
            }
            reader.Close();
            connection.Close();
            return StockInModelViewList;
        }
        public StockInViewModel GetReorderByItem(StockInViewModel stockInViewModel)
        {
            string query = "SELECT * FROM ItemSetup WHERE Sl='" +stockInViewModel.ItemSl + "' and CompanyId='"+stockInViewModel.CompanyId+"'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            stockInViewModel = null;
            
            if (reader.HasRows)
            {
                stockInViewModel = new StockInViewModel();
                stockInViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);    
            }
            reader.Close();
            connection.Close();

            return stockInViewModel;
        }
        public int Save(StockInModel stockInModel)
        {
            stockInModel.Type = "Buy";
            string query = "INSERT INTO StockInOut(ItemSl, Quantity,  Type, InTime) VALUES('" + stockInModel.ItemSl + "','" + stockInModel.Quantity + "','" + stockInModel.Type + "','" + stockInModel.InTime + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        //public bool IsRegNoExist(int companySl, string item)
        //{

        //    stockInModel.Type = "Buy";
        //    string query = "SELECT * FROM StockInOut WHERE Company='" + companySl + "' and Item='" + item + "' and Type='" + stockInModel.Type + "'";
        //    command = new SqlCommand(query, connection);
        //    connection.Open();
        //    reader = command.ExecuteReader();
        //    bool isExist = reader.HasRows;
        //    connection.Close();
        //    return isExist;

        //}
        //public int updateAvailableStock(StockInModel stockInModel)
        //{
        //    stockInModel.Type = "Buy";
        //    string query = "UPDATE StockInOut SET Quantity='" + stockInModel.Quantity + "' WHERE Company='" + stockInModel.CompanySl + "' and Item='" + stockInModel.Item + "'  and Type='"+stockInModel.Type+"'";
        //    SqlCommand command = new SqlCommand(query, connection);
        //    connection.Open();
        //    int rowAffect = command.ExecuteNonQuery();
        //    connection.Close();
        //    return rowAffect;
        //}
        public StockInViewModel GetQuantityByCompanyAndItem(StockInViewModel stockInViewModel)
        {
            stockInViewModel.Type = "Buy";

            string query = "TotalStock";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@item", stockInViewModel.ItemSl);

            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            stockInViewModel = null;

            if (reader.HasRows)
            {
                stockInViewModel = new StockInViewModel();
                stockInViewModel.Quantity = Convert.ToInt32(reader["Quantity"]);

            }
            reader.Close();
            connection.Close();

            return stockInViewModel;
        }
       

    }
}