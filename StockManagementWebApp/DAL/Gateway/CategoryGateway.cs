using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.DAL.Gateway
{
    public class CategoryGateway : BaseClassGateway
    {
        

        public int Save(CategoryModel categoryModel)
        {
            string query = "INSERT INTO CategoryInfo VALUES('" + categoryModel.Sl + "','" + categoryModel.CategoryName + "','" + categoryModel.InTime + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        public bool IsRegNoExist(string categoryName)
        {


            string query = "SELECT * FROM CategoryInfo WHERE CATEGORYNAME='" + categoryName + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;

        }
        public List<CategoryModel> GetAllCategory()
        {

            string query = "SELECT * FROM CategoryInfo";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<CategoryModel> CategoryList = new List<CategoryModel>();
            while (reader.Read())
            {
                CategoryModel catagoryModel = new CategoryModel();
                catagoryModel.Sl = Convert.ToInt32(reader["SL"]);
                catagoryModel.CategoryName = reader["CATEGORYNAME"].ToString();
                catagoryModel.InTime = reader["INTIME"].ToString();

                CategoryList.Add(catagoryModel);
            }
            reader.Close();
            connection.Close();
            return CategoryList;
        }

        public int GenerateId(CategoryModel categoryModel)
        {
            //string query = "SELECT MAX(SL) FROM CatagoryInfo";
            //SqlCommand command = new SqlCommand(query, connection);
            //connection.Open();
            //int SL = Convert.ToInt32(command.ExecuteNonQuery());
            //connection.Close();
            //return SL;
            string ID = "";

            connection.Open();
            command = new SqlCommand(@"SELECT Max(SL) FROM CategoryInfo", connection);
            reader = command.ExecuteReader();
            if (reader.Read())
            {

                ID = reader[0].ToString();
                if (ID == "")
                {
                    ID = "1";
                }
                else
                {
                    ID = (int.Parse(ID) + 1).ToString();
                }


            }

            reader.Close();
            connection.Close();
            int SL = Convert.ToInt32(ID);
            return SL;
        }

        public CategoryModel GetAllCategoryById(int id)
        {
            string query = "SELECT * FROM CategoryInfo WHERE Sl=" + id;
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            CategoryModel categoryModel = null;
            if (reader.HasRows)
            {
                categoryModel = new CategoryModel();
                categoryModel.Sl = Convert.ToInt32(reader["SL"]);
                categoryModel.CategoryName = reader["CATEGORYNAME"].ToString();


                reader.Close();
                connection.Close();

            }

            return categoryModel;
        }
        public int updateAllCategory(CategoryModel categoryModel)
        {
            string query = "UPDATE CategoryInfo SET CATEGORYNAME='" + categoryModel.CategoryName + "' WHERE Sl='" + categoryModel.Sl + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        //public int DeleteById(int id)
        //{
        //    string query = "DELETE FROM CatagoryInfo WHERE SL='" + id + "'";
        //    command = new SqlCommand(query, connection);
        //    connection.Open();
        //    int rowAffect = command.ExecuteNonQuery();
        //    connection.Close();
        //    return rowAffect;
        //}
    }
}