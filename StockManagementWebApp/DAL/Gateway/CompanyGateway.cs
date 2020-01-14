using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.DAL.Gateway
{
    public class CompanyGateway : BaseClassGateway
    {
       
        public int Save(CompanyModel companyModel)
        {
            string query = "INSERT INTO CompanyInfo VALUES('"+companyModel.Sl+"','" + companyModel.CompanyName + "','" + companyModel.InTime + "')";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        public bool IsRegNoExist(string companyName)
        {


            string query = "SELECT * FROM CompanyInfo WHERE CompanyName='" + companyName + "'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            bool isExist = reader.HasRows;
            connection.Close();
            return isExist;

        }
        public List<CompanyModel> GetAllCompany()
        {

            string query = "SELECT * FROM CompanyInfo";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<CompanyModel> companyModelList = new List<CompanyModel>();
            while (reader.Read())
            {
                CompanyModel companyModel = new CompanyModel();
                companyModel.Sl = Convert.ToInt32(reader["SL"]);
                companyModel.CompanyName = reader["COMPANYNAME"].ToString();
                companyModel.InTime = reader["INTIME"].ToString();

                companyModelList.Add(companyModel);
            }
            reader.Close();
            connection.Close();
            return companyModelList;

        }
        public int GenerateID(CompanyModel companyModel)
        {
            string ID = "";

            connection.Open();
            command = new SqlCommand(@"SELECT MAX(SL) FROM CompanyInfo", connection);
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
        public CompanyModel GetAllCompanyById(int id)
        {
            string query = "SELECT * FROM CompanyInfo WHERE Sl=" + id;
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            reader.Read();
            CompanyModel companyModel = null;
            if (reader.HasRows)
            {
                companyModel = new CompanyModel();
                companyModel.Sl = Convert.ToInt32(reader["SL"]);
                companyModel.CompanyName = reader["COMPANYNAME"].ToString();


                reader.Close();
                connection.Close();

            }

            return companyModel;
        }
        public int UpdateAllCompany(CompanyModel companyModel)
        {
            string query = "UPDATE CompanyInfo SET COMPANYNAME='" + companyModel.CompanyName + "' WHERE Sl='" + companyModel.Sl + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }
        //public int DeleteById(int id)
        //{
        //    string query = "DELETE FROM CompanyInfo WHERE SL='" + id + "'";
        //    command = new SqlCommand(query, connection);
        //    connection.Open();
        //    int rowAffect = command.ExecuteNonQuery();
        //    connection.Close();
        //    return rowAffect;
        //}
    }
}