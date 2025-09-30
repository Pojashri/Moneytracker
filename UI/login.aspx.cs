using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('✅ Login Successful!');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('❌ Invalid Email or Password');", true);

                }
            }
            catch (Exception ex)
            {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",  "alert('⚠️ Something went wrong. Please try again later.');", true);
            }
        }
    }
}