using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tracker.common;
using Tracker.data; 


namespace Tracker
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

  
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var email = txtInputEmail1.Text;
            var password = txtPassword.Text;
            var action = "login";
            try
            {
                var proc = Repository.userregister(action, email, password, null, null, 0);

                int code = Convert.ToInt32(proc["code"]);
                string message = (proc["message"].ToString());

                if (code == 200)
                {
                    helpers.ShowAlert(this, message);
                }
                else
                {
                    helpers.ShowAlert(this, message);
                }          
            }
            catch (Exception ex)
            {
                helpers.ShowAlert(this, "⚠️ Something went wrong. Please try again later.");
            }
        }
    }
}