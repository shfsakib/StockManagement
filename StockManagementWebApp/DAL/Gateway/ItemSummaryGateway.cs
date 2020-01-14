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
    public class ItemSummaryGateway : BaseClassGateway
    {
        public List<ItemSummaryViewModel> GetDetailsByForAll(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWANDSEARCHITEMFORALL";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemSummaryModelViewList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
                itemSummaryViewModel = new ItemSummaryViewModel();
                itemSummaryViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                itemSummaryViewModel.CompanyName = reader["CompanyName"].ToString();
                itemSummaryViewModel.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                itemSummaryViewModel.CategoryName = reader["CategoryName"].ToString();
                itemSummaryViewModel.ItemName = reader["ItemName"].ToString();
                itemSummaryViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemSummaryViewModel.Quantity = Convert.ToInt32(reader["Quantity"].ToString());
          
                itemSummaryModelViewList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemSummaryModelViewList;
        }
        public List<ItemSummaryViewModel> GetDetailsByCompany(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWANDSEARCHITEMFORCOMPANY";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@company", itemSummaryViewModel.CompanyId);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemSummaryModelViewList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
                itemSummaryViewModel = new ItemSummaryViewModel();
                itemSummaryViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                itemSummaryViewModel.CompanyName = reader["CompanyName"].ToString();
                itemSummaryViewModel.ItemName = reader["ItemName"].ToString();
                itemSummaryViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemSummaryViewModel.Quantity = Convert.ToInt32(reader["Quantity"].ToString());
           
                itemSummaryModelViewList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemSummaryModelViewList;
        }
        public List<ItemSummaryViewModel> GetDetailsByCategory(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWANDSEARCHITEMFORCATEGORY";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@category", itemSummaryViewModel.CategoryId);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemSummaryViewModelList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
                itemSummaryViewModel = new ItemSummaryViewModel();
                itemSummaryViewModel.CategoryId = Convert.ToInt32(reader["CategoryId"]);

                itemSummaryViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                itemSummaryViewModel.CompanyName = reader["CompanyName"].ToString();
                itemSummaryViewModel.ItemName = reader["ItemName"].ToString();
                itemSummaryViewModel.ItemSl = Convert.ToInt32(reader["ItemSl"]);
                itemSummaryViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemSummaryViewModel.Quantity = Convert.ToInt32(reader["Quantity"].ToString());
        
                itemSummaryViewModelList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemSummaryViewModelList;
        }
        public List<ItemSummaryViewModel> GetDetailsByCompanyAndCategory(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWBYCOMPANYANDCATEGORY";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@category", itemSummaryViewModel.CategoryId);
            command.Parameters.AddWithValue("@company", itemSummaryViewModel.CompanyId);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemSummaryModelViewList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
                itemSummaryViewModel = new ItemSummaryViewModel();
                itemSummaryViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
                itemSummaryViewModel.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                itemSummaryViewModel.CompanyName = reader["CompanyName"].ToString();
                itemSummaryViewModel.ItemName = reader["ItemName"].ToString();
                itemSummaryViewModel.ReorderLevel = Convert.ToInt32(reader["ReorderLevel"]);
                itemSummaryViewModel.Quantity = Convert.ToInt32(reader["Quantity"].ToString());
            
                itemSummaryModelViewList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemSummaryModelViewList;
        }
        public List<ItemSummaryViewModel> GetAllCompanyFromStock(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWALLCOMPANY";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemModelViewCompanyList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
               itemSummaryViewModel = new ItemSummaryViewModel();
               itemSummaryViewModel.CompanyId = Convert.ToInt32(reader["CompanyId"]);
               itemSummaryViewModel.CompanyName = reader["CompanyName"].ToString();

               itemModelViewCompanyList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelViewCompanyList;
        }
        public List<ItemSummaryViewModel> GetAllCategory(ItemSummaryViewModel itemSummaryViewModel)
        {

            string query = "VIEWALLCATEGORY";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<ItemSummaryViewModel> itemModelCompanyViewList = new List<ItemSummaryViewModel>();
            while (reader.Read())
            {
                itemSummaryViewModel = new ItemSummaryViewModel();
                itemSummaryViewModel.CategoryId = Convert.ToInt32(reader["CategoryId"]);
                itemSummaryViewModel.CategoryName = reader["CategoryName"].ToString();
                itemModelCompanyViewList.Add(itemSummaryViewModel);
            }
            reader.Close();
            connection.Close();
            return itemModelCompanyViewList;
        }

    }
}