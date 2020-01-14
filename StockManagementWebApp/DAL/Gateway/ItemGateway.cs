using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.DAL.Gateway
{
    public class ItemGateway : BaseClassGateway
    {

        public List<ItemViewModel> GetAllComapany()
        {

            string query = "SELECT * FROM CompanyInfo";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemViewModel> itemModelCompanyList = new List<ItemViewModel>();
            while (reader.Read())
            {
                ItemViewModel itemViewModel = new ItemViewModel();
                itemViewModel.CompanySl = Convert.ToInt32(reader["Sl"]);

                itemViewModel.CompanyName = reader["CompanyName"].ToString();


                itemModelCompanyList.Add(itemViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelCompanyList;

        }
        public List<ItemViewModel> GetAllCategory()
        {

            string query = "SELECT * FROM CategoryInfo";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemViewModel> itemModelCatagoryList = new List<ItemViewModel>();
            while (reader.Read())
            {
                ItemViewModel itemViewModel = new ItemViewModel();
                itemViewModel.CategorySl = Convert.ToInt32(reader["Sl"]);

                itemViewModel.CategoryName = reader["CategoryName"].ToString();
                itemModelCatagoryList.Add(itemViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelCatagoryList;

        }
        public int Save(ItemModel itemModel)
        {
            string query = "INSERT INTO ItemSetup VALUES('" + itemModel.CategoryId + "','" + itemModel.CompanyId + "','" + itemModel.ItemName + "','" + itemModel.ReorderLevel + "','" + itemModel.InTime + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        public bool IsRegNoExist(string itemName,int company,int category)
        {


            string query = "SELECT * FROM ItemSetup WHERE CompanyID='" + company + "' AND CategoryID='" + category + "' AND ITEMNAME='" + itemName + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;

        }
    }
}