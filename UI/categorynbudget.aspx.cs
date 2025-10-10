using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tracker.common;
using Tracker.data;

namespace Tracker
{
    public partial class categorynbudget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    //GetTransactions();
                    Repository.Bind(ddlCategory, Repository.categories, "", 2, "CategoryName", "CategoryId");
                }
                catch (Exception ex)
                {
                    helpers.ShowAlert(this, "Something went wrong. Please try again later.");
                }
          
            }
            
        }
      

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            string name = txtCategoryName.Text;
            var savecategory = Repository.categories(name, 1);

            int code = Convert.ToInt32(savecategory["code"]);
            string message = savecategory["message"].ToString();
            if (code != 200)
                helpers.ShowAlert(this, message);

           
        }

        protected void btnSaveTransaction_Click(object sender, EventArgs e)
        {
            string description = txtDescription.Text;
            decimal price = Convert.ToInt32(txtAmount.Text);
            int categoryId = Convert.ToInt32(ddlCategory.SelectedValue);
            var savecategory = Repository.transactions(description, price, categoryId, 1 );
            int code = Convert.ToInt32(savecategory["code"]);
            string message = savecategory["message"].ToString();
            if (code != 200)
                helpers.ShowAlert(this, message);
        }

        [System.Web.Services.WebMethod]
        public static List<TransactionModel> GetTransactions()
        {
            using (var db = new Context())
            {
                var result = Repository.transactions("", 0, 0, 2); // 2 = Get action
                DataTable dt = (DataTable)result["data"];

                List<TransactionModel> list = new List<TransactionModel>();
                foreach (DataRow row in dt.Rows)
                {
                    list.Add(new TransactionModel
                    {
                        Description = row["Description"].ToString(),
                        Price = Convert.ToDecimal(row["Price"]),
                        CreatedAt = Convert.ToDateTime(row["CreatedAt"]).ToString("yyyy-MM-dd"),
                        CategoryName = row["CategoryName"].ToString()
                    });
                }
                return list;
            }
        }

        public class TransactionModel
        {
            public string Description { get; set; }
            public decimal Price { get; set; }
            public string CreatedAt { get; set; }
            public string CategoryName { get; set; }
        }



    }
}