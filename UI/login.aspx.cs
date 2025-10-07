
using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tracker.common;
using Tracker.data;
using System.Security.Claims;


namespace Tracker
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var email = txtLoginEmail.Text;
            var password = txtLoginPassword.Text;
            try
            {
                if (string.IsNullOrWhiteSpace(email))    { helpers.ShowAlert(this, "Please enter email.");    return; }
                if (string.IsNullOrWhiteSpace(password)) { helpers.ShowAlert(this, "Please enter password."); return; }
                ;
                var user = Repository.userregister("getpassword", email, null, null, null, 0);

                if (user == null || user["password"] == DBNull.Value) { helpers.ShowAlert(this, "User not found."); return; }
                string storedHash = user["password"].ToString();
                bool verified = BCrypt.Net.BCrypt.Verify(password, storedHash);
                if (!verified) { helpers.ShowAlert(this, "Invalid credentials."); return; }

                int code = Convert.ToInt32(user["code"]);
                string message = user["message"].ToString();

                if (code != 200)
                    helpers.ShowAlert(this, message);
                else
                    helpers.ShowAlert(this, "Login successful!");
                    Response.Redirect("Dashboard.aspx");
            }
            catch (Exception)
            {
                helpers.ShowAlert(this, "Something went wrong. Please try again later.");
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var email = txtRegisterEmail.Text;
            var password = txtRegisterPassword.Text;
            try
            {
                if (string.IsNullOrWhiteSpace(email)) { helpers.ShowAlert(this, "Please enter email."); return; }
                if (string.IsNullOrWhiteSpace(password)) { helpers.ShowAlert(this, "Please enter password."); return; }
                string passwordHash = BCrypt.Net.BCrypt.HashPassword(password, workFactor: 12);

                var proc = Repository.userregister("register", email, passwordHash, null, null, 0);
                int code = Convert.ToInt32(proc["code"]);
                string message = (proc["message"].ToString());

                if (code == 200) { helpers.ShowAlert(this, message); return; }
                else helpers.ShowAlert(this, message);
            }
            catch (Exception)
            {
                helpers.ShowAlert(this, "Something went wrong. Please try again later.");
            }
        }

        //protected void btnGoogleLogin_Click(object sender, EventArgs e)
        //{

        //    //HttpContext.Current.GetOwinContext().Authentication.Challenge(
        //    //    new AuthenticationProperties
        //    //    {
        //    //        RedirectUri = "/"
        //    //    },
        //    //    "Google"
        //    //);
        //}
    }
}