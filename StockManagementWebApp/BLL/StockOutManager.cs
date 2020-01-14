using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    public class StockOutManager
    {
        StockOutGateway stockOutGateway = new StockOutGateway();
        public List<StockOutViewModel> GetAllCompanyFromStock(StockOutViewModel stockOutModel)
        {
            return stockOutGateway.GetAllCompanyFromStock(stockOutModel);
        }

        public List<StockOutViewModel> GetAllItemByCompany(StockOutViewModel stockOutModel)
        {
            return stockOutGateway.GetAllItemByCompany(stockOutModel);
        }

        public StockOutViewModel GetReorderByItem(StockOutViewModel stockOutModel)
        {
            return stockOutGateway.GetReorderByItem(stockOutModel);
        }

        public StockOutViewModel GetQuantityByItem(StockOutViewModel stockOutModel)
        {
            return stockOutGateway.GetQuantityByItem(stockOutModel);
        }

        public string SaveAllSaleRowFromGrid(StockOutModel stockOutModel)
        {
            int rowAffect = stockOutGateway.SaveAllSaleRowFromGrid(stockOutModel);
            if (rowAffect > 0)
            {
                return "Save Sale Succefully";
            }
            else
            {
                return "Save Failed";
            }
        }
        public string SaveAllDamageRowFromGrid(StockOutModel stockOutModel)
        {
            int rowAffect = stockOutGateway.SaveAllDamageRowFromGrid(stockOutModel);
            if (rowAffect > 0)
            {
                return "Save Damage Succefully";
            }
            else
            {
                return "Save Failed";
            }
        }
        public string SaveAllLossRowFromGrid(StockOutModel stockOutModel)
        {
            int rowAffect = stockOutGateway.SaveAllDamageRowFromGrid(stockOutModel);
            if (rowAffect > 0)
            {
                return "Save Lost Succefully";
            }
            else
            {
                return "Save Failed";
            }
        }
    }
}