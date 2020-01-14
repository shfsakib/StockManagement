using System;
using System.Drawing;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.UI
{
    public partial class IndexUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendMessageButton_Click1(object sender, EventArgs e)
        {
            //string message = "<b>Sender name:</b>" + nameTextBox.Text + "<br/>" + "<b>Email :</b>" + emailTextBox.Text +
            //                 "<br/>" + "<b>Subjet :</b>" + subjectTextBox.Text + "<br/>" + "Message :" +
            //                 messageTextBox.Text + "<br/>";
            try
            {
                MailMessage mailMessage = new MailMessage(nameTextBox.Text, emailTextBox.Text, subjectTextBox.Text, messageTextBox.Text);
                mailMessage.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 25);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new System.Net.NetworkCredential("shfsakib@gmail.com", "StockManagement");
                smtpClient.Send(mailMessage);
                mailLabel.Text = "Send successfully";
                mailLabel.ForeColor = Color.Green;

            }
            catch (Exception ex)
            {
                mailLabel.Text = "Service not available now!";
                mailLabel.ForeColor = Color.Red;

            }


        }



        protected void submitButton_Click(object sender, EventArgs e)
        {
            LogInModel aLogin = new LogInModel();
            LogInManager logInManager = new LogInManager();
            aLogin.Email = emailIdTextBox.Text;
            aLogin.Password = passwordLogTextBox.Text;
            string message = logInManager.LogIn(aLogin);

            if (message == "Login Successful")
            {
                Session["Email"] = logInManager.GetEmail(aLogin).ToString();
                Response.Redirect("/UI/CategoryInformationUI.aspx");
            }
            else
            {
                errorLabelMessage.Text = "login failed!";
                errorLabelMessage.ForeColor = Color.Red;

                Response.Write("<script>alert('" + message + "')</script>");

                emailIdTextBox.Text = passwordLogTextBox.Text = "";

            }

        }
    }
}