namespace StockManagementWebApp.DAL.Model.View_Model
{
    public class StockInViewModel
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
     
        public int ItemSl { get; set; }
        public string ItemName { get; set; }
        public int ReorderLevel { get; set; }
        public int Quantity { get; set; }
        public int StockInQuantity { get; set; }
        public string Type { get; set; }
        public string InTime { get; set; }
    }
}