using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    public class ItemManager
    {
        ItemGateway itemGateway = new ItemGateway();

        public List<ItemViewModel> GetAllComapany()
        {
            return itemGateway.GetAllComapany();
        }

        public List<ItemViewModel> GetAllCategory()
        {
            return itemGateway.GetAllCategory();
        }
        public string Save(ItemModel itemModel)
        {
            if (itemGateway.IsRegNoExist(itemModel.ItemName,itemModel.CompanyId,itemModel.CategoryId))
            {
                return "Item already exist for this Company name and Category";
            }
            else
            {
                 int rowAffect = itemGateway.Save(itemModel);

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
       
    }
}