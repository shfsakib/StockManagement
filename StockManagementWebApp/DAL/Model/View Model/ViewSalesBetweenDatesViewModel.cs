namespace StockManagementWebApp.DAL.Model.View_Model
{
    public class ViewSalesBetweenDatesViewModel
    {
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string Item { get; set; }
        public int Quantity { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }
        public string Type { get; set; }
    }
}