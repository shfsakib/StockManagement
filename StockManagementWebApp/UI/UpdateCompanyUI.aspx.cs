using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.UI
{
    public partial class UpdateCompanyUI : System.Web.UI.Page
    {
        CompanyManager companyManager = new CompanyManager();
        private CompanyModel companyModel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (IsPostBack == false)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);
                companyModel = companyManager.GetAllCompanyById(id);
                if (companyModel != null)
                {
                    LoadFormWithCompany(companyModel);
                }
            }
        }

        private void LoadFormWithCompany(CompanyModel companyModel)
        {
            idHiddenField.Value = companyModel.Sl.ToString();
            companyNameTextBox.Text = companyModel.CompanyName;

        }

        protected void updateButton_OnClick(object sender, EventArgs e)
        {
            companyModel = new CompanyModel();
            companyModel.Sl = Convert.ToInt32(idHiddenField.Value);

            companyModel.CompanyName = companyNameTextBox.Text;

            if (companyNameTextBox.Text!="")
            {
                string message = companyManager.updateByID(companyModel);

            Response.Write("<script>alert('" + message + "')</script>");
            companyNameTextBox.Text = "";
            }
            else
            {
                Response.Write("<script>alert('null cannot be insert!')</script>");

            }

        }

        protected void backButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/UI/CompanyInformationUI.aspx");
        }
    }
}