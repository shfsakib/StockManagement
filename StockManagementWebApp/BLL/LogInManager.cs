using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    public class LogInManager
    {
        LogInGateway logInGateway = new LogInGateway();
        
        
        public string LogIn(LogInModel logIn)
        {
            int rowAffect = logInGateway.LogIn(logIn);
        

            if(rowAffect>0)
            {
              return "Login Successful";
            }
            else
            {
                return "Email and password are mismatch!";
            }
        
        }

        public string ForgotPassword(LogInModel logInModel)
        {
            int rowAffect = logInGateway.ForgotPassword(logInModel);
            if (rowAffect>0)
            {
                return "Changed Successfully";
            }
            else
            {
                return "Not Changed";
                
            }
        }

        public List<LogInModel> GetEmail(LogInModel logInModel)
        {
            return logInGateway.GetEmail(logInModel);
        }
    }
}