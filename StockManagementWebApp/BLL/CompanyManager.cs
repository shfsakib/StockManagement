using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.BLL
{
    public class CompanyManager
    {
        CompanyGateway companyGateway = new CompanyGateway();

        public string Save(CompanyModel companyModel)
        {

            if (companyGateway.IsRegNoExist(companyModel.CompanyName))
            {
                return "Company Name Already Exist";
            }
            else
            {
                int rowAffect = companyGateway.Save(companyModel);

                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";
                }
            }
        }




        public List<CompanyModel> getAllCompany()
        {
            return companyGateway.GetAllCompany();
        }
        public int GenerateID(CompanyModel companyModel)
        {
            int SL = companyGateway.GenerateID(companyModel);
     
            return SL;
        }
        public CompanyModel GetAllCompanyById(int id)
        {
            return companyGateway.GetAllCompanyById(id);
        }
        public string updateByID(CompanyModel companyModel)
        {
            int rowAffect = companyGateway.UpdateAllCompany(companyModel);

            if (rowAffect > 0)
            {
                return "Update Successful";
            }
            else
            {
                return "Update Failed";
            }
        }
        //public string DeleteById(int id)
        //{
        //    int rowAffect = companyGateway.DeleteById(id);
        //    if (rowAffect > 0)
        //    {
        //        return "Delete Successful";
        //    }
        //    else
        //    {
        //        return "Delete Failed";
        //    }
        //}
    }
}