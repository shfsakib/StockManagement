using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    public class ItemSummaryManager
    {
        ItemSummaryGateway itemSummaryGateway = new ItemSummaryGateway();
        public List<ItemSummaryViewModel> GetDetailsByForAll(ItemSummaryViewModel itemSummaryModel)
        {
            return itemSummaryGateway.GetDetailsByForAll(itemSummaryModel);
        }

        public List<ItemSummaryViewModel> GetDetailsByCompany(ItemSummaryViewModel itemSummaryModel)
        {
            return itemSummaryGateway.GetDetailsByCompany(itemSummaryModel);
        }

        public List<ItemSummaryViewModel> GetDetailsByCategory(ItemSummaryViewModel itemSummaryModel)
        {
            return itemSummaryGateway.GetDetailsByCategory(itemSummaryModel);
        }
        public List<ItemSummaryViewModel> GetAllCompanyFromStock(ItemSummaryViewModel itemSummaryModel)
        {
           return itemSummaryGateway.GetAllCompanyFromStock(itemSummaryModel);
        }

        public List<ItemSummaryViewModel> GetAllCategory(ItemSummaryViewModel itemSummaryModel)
        {
            return itemSummaryGateway.GetAllCategory(itemSummaryModel);
        }

        public List<ItemSummaryViewModel> GetDetailsByCompanyAndCategory(ItemSummaryViewModel itemSummaryModel)
        {
            return itemSummaryGateway.GetDetailsByCompanyAndCategory(itemSummaryModel);
        }

    }
}