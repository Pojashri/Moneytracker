using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity.Infrastructure;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
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
    }
}