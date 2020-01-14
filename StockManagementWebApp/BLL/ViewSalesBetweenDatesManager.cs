using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.BLL
{
    
    public class ViewSalesBetweenDatesManager
    {
        ViewSalesBetweenDatesGateway viewSalesBetweenDatesGateway=new ViewSalesBetweenDatesGateway();
        public List<ViewSalesBetweenDatesViewModel> GetAllBetweenDate(ViewSalesBetweenDatesViewModel viewSalesBetweenDatesViewModel)
        {
            return viewSalesBetweenDatesGateway.GetAllBetweenDate(viewSalesBetweenDatesViewModel);
        }

    }
}