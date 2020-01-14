using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    public class StockInManager
    {
         StockInGateway stockInGateway = new StockInGateway();
        public List<StockInViewModel> GetAllItemCompany()
        {
            return stockInGateway.GetAllItemCompany();
        }

        public List<StockInViewModel> GetAllItemByCompany(StockInViewModel stockInViewModel)
        {
            return stockInGateway.GetAllItemByCompany(stockInViewModel);
        }

        public StockInViewModel GetReorderByItem(StockInViewModel stockInModel)
        {
            return stockInGateway.GetReorderByItem(stockInModel);
        }

        public StockInViewModel GetQuantityByCompanyAndItem(StockInViewModel stockInModel)
        {
            return stockInGateway.GetQuantityByCompanyAndItem(stockInModel);


        }
        public string Save(StockInModel stockInModel)
        {

            int rowAfftet = stockInGateway.Save(stockInModel);
            if (rowAfftet > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Save failed";
            }
        }


    }
}