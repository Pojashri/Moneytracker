using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tracker.common;
using Tracker.data;

namespace Tracker.common
{
    public static class helpers
    {
        public static void ShowAlert(Page page, string message)
        {
            page.ClientScript.RegisterStartupScript(
                page.GetType(),
                "alert",
                $"alert('{message}');",
                true
            );
        }
    }
}