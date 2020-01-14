using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.DAL.Gateway
{
    public class LogInGateway : BaseClassGateway
    {
       

        //public bool IsRegNoExist(string password,string email)
        //{
        //    string query = "select *  from LogIn where EMAIL='" + email + "' and PASSWORD='" + password + "'";
        //    command = new SqlCommand(query, connection);
        //    connection.Open();
        //    reader = command.ExecuteReader();
        //    bool isExist = reader.HasRows;
        //    connection.Close();
        //    return isExist;

        //}
        public int LogIn(LogInModel logInModel)
        {
            DataTable dataTable = new DataTable();

            string query = "caseSensative";
            command = new SqlCommand(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@email", logInModel.Email);
            command.Parameters.AddWithValue("@password", logInModel.Password);
            
            connection.Open();
            adapter= new SqlDataAdapter(command);
            adapter.Fill(dataTable);
            int rowAffect = dataTable.Rows.Count;
            connection.Close();
            return rowAffect;
        }
        public int ForgotPassword(LogInModel logInModel)
        {
            string query = "UPDATE LogIn SET Password='" + logInModel.Password + "' WHERE Email='" + logInModel.Email + "' AND SecurityQuestion='" + logInModel.SecurityQuestion + "' AND Answer='" + logInModel.Answer + "'";
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();
            return rowAffect;
        }

        public List<LogInModel> GetEmail(LogInModel logInModel)
        {

            string query = "SELECT * FROM LogIn where Email='"+logInModel.Email+"'";
            command = new SqlCommand(query, connection);
            connection.Open();
            reader = command.ExecuteReader();
            List<LogInModel> logInModelList = new List<LogInModel>();
            while (reader.Read())
            {
                logInModel = new LogInModel();
                logInModel.Email = reader["Email"].ToString();
               

                logInModelList.Add(logInModel);
            }
            reader.Close();
            connection.Close();
            return logInModelList;
        }
    }
}