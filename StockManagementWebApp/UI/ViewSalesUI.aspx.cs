using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.UI
{
    public partial class ViewSalesUI : System.Web.UI.Page
    {
        ViewSalesBetweenDatesViewModel viewSalesBetweenDatesViewModel = new ViewSalesBetweenDatesViewModel();
        ViewSalesBetweenDatesManager viewSalesBetweenDatesViewManager = new ViewSalesBetweenDatesManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (!IsPostBack)
            {

            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (typeDropdownList.Text == "Select a Type")
            {
                viewSalesBetweenDatesViewModel.Type = "Nothing";
                messageLabel.Text = "Please fill all fields correctly!";

            }
            else if (typeDropdownList.SelectedIndex<=0)
            {
                viewSalesBetweenDatesViewModel.Type = "Nothing";
                messageLabel.Text = "Please fill all fields correctly!";
            }
            if (dateTimeFromTextBox.Text!="" && dateTimeToTextBox.Text!="")
            {
                viewSalesBetweenDatesViewModel.FromDate = dateTimeFromTextBox.Text;
                viewSalesBetweenDatesViewModel.ToDate = dateTimeToTextBox.Text;
                viewSalesBetweenTwoDatesGrid.DataSource = viewSalesBetweenDatesViewManager.GetAllBetweenDate(viewSalesBetweenDatesViewModel);
                viewSalesBetweenTwoDatesGrid.DataBind();
                typeDropdownList.Text = "Select a Type";
                messageLabel.Text = "";

            }
            else
            {
                viewSalesBetweenTwoDatesGrid.DataSource = null;
                viewSalesBetweenTwoDatesGrid.DataBind();
                messageLabel.Text = "Please fill all fields correctly!";
                typeDropdownList.Text = "Select a Type";
              

            }
           
        }

        protected void typeDropdownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            viewSalesBetweenDatesViewModel.FromDate = dateTimeFromTextBox.Text;
            viewSalesBetweenDatesViewModel.ToDate = dateTimeToTextBox.Text;

            viewSalesBetweenDatesViewModel.Type = typeDropdownList.Text;

        }

        protected void exportAsPdf_Click(object sender, EventArgs e)
        {
            if (viewSalesBetweenTwoDatesGrid.Rows.Count>0)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=ViewSales.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //hide the link button column

                //Outputs server control content to a provided System.Web.UI.HtmlTextWriter
                viewSalesBetweenTwoDatesGrid.RenderControl(hw);

                //load the html content to the string reader
                StringReader sr = new StringReader(sw.ToString());

                //HTMLDocument
                //Document(Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom)
                Document document = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

                //iText class that allows you to convert HTML to PDF
                HTMLWorker htmlWorker = new HTMLWorker(document);

                //When this PdfWriter is added to a certain PdfDocument,
                //the PDF representation of every Element added to this Document will be written to the outputstream.
                PdfWriter.GetInstance(document, Response.OutputStream);

                //open the document
                document.Open();

                htmlWorker.Parse(sr);

                //close the document stream
                document.Close();

                //write the content to the response stream
                Response.Write(document);
                Response.End();
            }
            
            else
            {
                typeDropdownList.Text = "Select a Type";
                messageLabel.Text = "Please choose dates and type first!";
            }

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void signOutButton_OnClick(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("/UI/IndexUI.aspx");
        }
    }
}