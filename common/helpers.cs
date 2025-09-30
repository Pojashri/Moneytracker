using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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