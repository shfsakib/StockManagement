using System;

namespace StockManagementWebApp.DAL.Model.View_Model
{
    public class ItemViewModel
    {
        public int Sl { get; set; }
        public int CategorySl { get; set; }
        public string CategoryName { get; set; }
        public int CompanySl { get; set; }
        public String CompanyName { get; set; }
        public string ItemName { get; set; }
        public int ReorderLevel { get; set; }
        public string InTime { get; set; }
    }
}