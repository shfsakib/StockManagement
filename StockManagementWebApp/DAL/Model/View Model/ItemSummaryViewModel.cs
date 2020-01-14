namespace StockManagementWebApp.DAL.Model.View_Model
{
    public class ItemSummaryViewModel
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string ItemName { get; set; }
        public int ItemSl { get; set; }
        public int ReorderLevel { get; set; }
        public int Quantity { get; set; }
        public string Type { get; set; }
    }
}