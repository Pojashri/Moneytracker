using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI.WebControls;
using Tracker.common;
namespace Tracker.data
{
    public class Repository
    {
        private readonly Context _context;
        public Repository(Context context)
        {
            _context = context;
        }
        public static Dictionary<string, object> userregister(string Action, string Email, string PasswordHash,  string Firstname, string Lastname,  int UserId)
        {
            SqlParameter[] paramArr = new SqlParameter[]
            {
                new SqlParameter("@Action", Action),
                new SqlParameter("@Firstname", Firstname),
                new SqlParameter("@Lastname", Lastname),
                new SqlParameter("@Email", Email),
                new SqlParameter("@PasswordHash", PasswordHash),
                new SqlParameter("@UserId", UserId),
                new SqlParameter("@code", SqlDbType.Int) { Direction = ParameterDirection.Output },
                new SqlParameter("@message", SqlDbType.VarChar, 255) { Direction = ParameterDirection.Output }
            };

            using (var db = new Context())
            {
                var ds = SqlHelper.ExecuteDataset(db.Database.Connection.ConnectionString, CommandType.StoredProcedure, "AuthUser", paramArr);
                var result = new Dictionary<string, object>
                {
                    { "code", Convert.ToInt32(paramArr[6].Value) },
                    { "message", paramArr[7].Value.ToString() }

                };
                if (ds.Tables.Count>0 && ds.Tables[0].Rows.Count>0)
                {
                    result["password"] = ds.Tables[0].Rows[0]["password"].ToString();
                }
              
               
                return result;
            }
        }
        // create and get transaction categories
        public static Dictionary<string , object> categories(string name, int action)
        {
            SqlParameter[] paramArr = new SqlParameter[]
            {
                new SqlParameter("@name", name),
                new SqlParameter("@action", action),
                new SqlParameter("@code", SqlDbType.Int) { Direction = ParameterDirection.Output },
                new SqlParameter("@message", SqlDbType.VarChar, 255) { Direction = ParameterDirection.Output }
            };
            using (var db = new Context())
            {
                var ds = SqlHelper.ExecuteDataset(db.Database.Connection.ConnectionString, CommandType.StoredProcedure, "sp_Categories", paramArr);
                var result = new Dictionary<string, object>
                {
                    { "code", Convert.ToInt32(paramArr[2].Value) },
                    { "message", paramArr[3].Value.ToString() },
                    { "data", ds.Tables.Count > 0 ? ds.Tables[0] : null }
                };
                return result;
            }
           
        }
        public static Dictionary<string, object> transactions( string decription, decimal price,  int category, int action)
        {
            SqlParameter[] paramArr = new SqlParameter[]
            {
                new SqlParameter("@categoryid", category),
                new SqlParameter("@decription", decription),
                new SqlParameter("@price", price),
                new SqlParameter("@action", action),
                new SqlParameter("@code", SqlDbType.Int) { Direction = ParameterDirection.Output },
                new SqlParameter("@message", SqlDbType.VarChar, 255) { Direction = ParameterDirection.Output }
            };

            using (var db = new Context())
            {
                var ds = SqlHelper.ExecuteDataset(db.Database.Connection.ConnectionString, CommandType.StoredProcedure, "sp_Transactions", paramArr);
                var result = new Dictionary<string, object>
                    {
                        { "code", Convert.ToInt32(paramArr[4].Value) },
                        { "message", paramArr[5].Value.ToString() },
                        { "data", ds.Tables.Count > 0 ? ds.Tables[0] : null }
                    };
                return result;
            }
        }
        public static void Bind(DropDownList ddl,
                           Func<string, int, Dictionary<string, object>> repoMethod,  // e.g. Repository.categories
                           string nameParam,
                           int action,
                           string textField,
                           string valueField,
                           string emptyText = "-- Select --")
        {
            try
            {
                var result = repoMethod(nameParam, action); // call any repo method
                if (result != null && result["data"] != null)
                {
                    var dt = result["data"] as DataTable;

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        ddl.DataSource = dt;
                        ddl.DataTextField = textField;
                        ddl.DataValueField = valueField;
                        ddl.DataBind();
                        ddl.Items.Insert(0, new ListItem(emptyText, ""));
                        return;
                    }
                }

                ddl.Items.Clear();
                ddl.Items.Add(new ListItem("-- No Data Found --", ""));
            }
            catch (Exception)
            {
                ddl.Items.Clear();
                ddl.Items.Add(new ListItem("-- Error Loading Data --", ""));
            }
        }
    }
}