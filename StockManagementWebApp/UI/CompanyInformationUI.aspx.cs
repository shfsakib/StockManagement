using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.UI
{
    public partial class CompanyInformation : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        CompanyModel companyModel = new CompanyModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (!IsPostBack)
            {
                IdGenerate(companyModel);
            }
            companyGridView.DataSource = companyManager.getAllCompany();
            companyGridView.DataBind();
        }
        private void IdGenerate(CompanyModel companyModel)
        {
            idLabel.Text = companyManager.GenerateID(companyModel).ToString();
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (companyNameTextBox.Text!="")
            {
                IdGenerate(companyModel);
                DateTime dateTime = DateTime.Now;
                companyModel.Sl = Convert.ToInt32(idLabel.Text);
                

                companyModel.CompanyName = companyNameTextBox.Text;
                companyModel.InTime = dateTime.ToString("MM-dd-yyyy");
                string message = companyManager.Save(companyModel);
                //Response.Write("<script>alert('" + message + "')</script>");
                companyErrorLabel.Text = message;
                companyErrorLabel.ForeColor = Color.Green;

                companyNameTextBox.Text = "";
                companyGridView.DataSource = companyManager.getAllCompany();
                companyGridView.DataBind();
                //Response.Redirect("CompanyInformationUI.aspx");
            }
            else
            {
                companyErrorLabel.Text = "Null can't be insert";
                companyErrorLabel.ForeColor = Color.Red;

            }



        }

        
        protected void updateLinkButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow row = (GridViewRow)cell.Parent;
            HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
            int id = Convert.ToInt32(idHiddenField.Value);
            Response.Redirect("/UI/UpdateCompanyUI.aspx?Id=" + id);
        }

        protected void companyNameTextBox_TextChanged(object sender, EventArgs e)
        {
            companyErrorLabel.Text = "";
        }

        //protected void deleteButton_OnClick(object sender, EventArgs e)
        //{
        //    LinkButton linkButton = (LinkButton)sender;
        //    DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
        //    GridViewRow row = (GridViewRow)cell.Parent;
        //    HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
        //    int id = Convert.ToInt32(idHiddenField.Value);
        //    companyManager.DeleteById(id);

        //    companyGridView.DataSource = companyManager.getAllCompany();
        //    companyGridView.DataBind();
        //    Response.Redirect("CompanyInformationUI.aspx");

        //}
    }
}