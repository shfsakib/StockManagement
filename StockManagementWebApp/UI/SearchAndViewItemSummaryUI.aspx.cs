using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;
using Color = System.Drawing.Color;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace StockManagementWebApp.UI
{
    public partial class SearchAndViewItemSummaryUI : System.Web.UI.Page
    {
        ItemSummaryManager itemSummaryManager = new ItemSummaryManager();
        ItemSummaryViewModel itemSummaryViewModel = new ItemSummaryViewModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (!IsPostBack)
            {
                itemSummaryViewModel.Type = "Buy";
                searchAndViewItemGridView.DataSource = itemSummaryManager.GetDetailsByForAll(itemSummaryViewModel);
                searchAndViewItemGridView.DataBind();
                GetAllCompany(itemSummaryViewModel);
                GetAllCategory(itemSummaryViewModel);


            }
        }

        private void GetAllCompany(ItemSummaryViewModel itemSummaryViewModel)
        {
            CompanyDropDownList.DataSource = itemSummaryManager.GetAllCompanyFromStock(itemSummaryViewModel);
            CompanyDropDownList.DataValueField = "CompanyId";
            CompanyDropDownList.DataTextField = "CompanyName";
            CompanyDropDownList.DataBind();

            CompanyDropDownList.Items.Insert(0, new ListItem("Select a Company"));
        }
        private void GetAllCategory(ItemSummaryViewModel itemSummaryViewModel)
        {
            categoryDropDownList.DataSource = itemSummaryManager.GetAllCategory(itemSummaryViewModel);
            categoryDropDownList.DataValueField = "CategoryId";
            categoryDropDownList.DataTextField = "CategoryName";
            categoryDropDownList.DataBind();

            categoryDropDownList.Items.Insert(0, new ListItem("Select a Category"));
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            if (CompanyDropDownList.Text == "Select a Company" && categoryDropDownList.Text == "Select a Category")
            {
                searchAndViewItemGridView.DataSource = itemSummaryManager.GetDetailsByForAll(itemSummaryViewModel);
                searchAndViewItemGridView.DataBind();
                CompanyDropDownList.Text = "Select a Company";
                categoryDropDownList.Text = "Select a Category";
                messageLabel.Text = "";



            }
            else if (categoryDropDownList.Text == "Select a Category")
            {
                searchAndViewItemGridView.DataSource = itemSummaryManager.GetDetailsByCompany(itemSummaryViewModel);
                searchAndViewItemGridView.DataBind();

                CompanyDropDownList.Text = "Select a Company";
                categoryDropDownList.Text = "Select a Category";
                messageLabel.Text = "";

            }
            else if (CompanyDropDownList.Text == "Select a Company")
            {
                searchAndViewItemGridView.DataSource = itemSummaryManager.GetDetailsByCategory(itemSummaryViewModel);
                searchAndViewItemGridView.DataBind();

                CompanyDropDownList.Text = "Select a Company";
                categoryDropDownList.Text = "Select a Category";
                messageLabel.Text = "";


            }
            else if (CompanyDropDownList.Text != "Select a Company" && categoryDropDownList.Text != "Select a Category")
            {

                searchAndViewItemGridView.DataSource = itemSummaryManager.GetDetailsByCompanyAndCategory(itemSummaryViewModel);
                searchAndViewItemGridView.DataBind();

                CompanyDropDownList.Text = "Select a Company";
                categoryDropDownList.Text = "Select a Category";
                messageLabel.Text = "";


            }

        }

        protected void CompanyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CompanyDropDownList.Text == "Select a Company")
            {
                itemSummaryViewModel.Type = "Buy";
                itemSummaryViewModel.CompanyId = 0;

            }
            else
            {
                itemSummaryViewModel.Type = "Buy";
                itemSummaryViewModel.CompanyId = Convert.ToInt32(CompanyDropDownList.SelectedValue);
            }


        }

        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (categoryDropDownList.Text == "Select a Category")
            {
                itemSummaryViewModel.Type = "Buy";
                itemSummaryViewModel.CategoryId = 0;

            }
            else
            {
                itemSummaryViewModel.Type = "Buy";
                itemSummaryViewModel.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
            }

        }

        protected void exportPdfButton_Click(object sender, EventArgs e)
        {
            if (searchAndViewItemGridView.Rows.Count>0)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=ViewItems.pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //hide the link button column

                //Outputs server control content to a provided System.Web.UI.HtmlTextWriter
                searchAndViewItemGridView.RenderControl(hw);

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
                
                messageLabel.Text = "Please check all fields!";
                messageLabel.ForeColor=Color.Red;
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