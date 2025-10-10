using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tracker.data;
using static Tracker.categorynbudget;

namespace Tracker
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static object Getdashboardkpis()
        {
            List<object> list = new List<object>();
            var constr = Repository.dashboardkpis();

            DataTable dt = (DataTable)constr["data"];

           
            foreach (DataRow row in dt.Rows)
            {
                list.Add(new
                {
                    name = row["name"].ToString(),
                    totalprice = Convert.ToDecimal(row["totalprice"])
                });
            }
            return list;
        }

    }
}